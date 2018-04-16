package main

import (
    "fmt"
    "github.com/hyperledger/fabric/core/chaincode/shim" // import for Chaincode Interface
    pb "github.com/hyperledger/fabric/protos/peer"      // import for peer response
    "encoding/json"
)

// Defined to implement chaincode interface
type ArtXchg struct {
}

// Define our struct to store Art in Blockchain, start fields upper case for JSON
type ART struct {
    Snumber string  // This one will be our key
    ArtType string
    ArtGenre string
    Status string   // this will contain its status on the exchange
}

// Implement Init
func (c *ArtXchg) Init(stub shim.ChaincodeStubInterface) pb.Response { 
    return shim.Success(nil) 
}

// Implement Invoke
func (c *ArtXchg) Invoke(stub shim.ChaincodeStubInterface) pb.Response { 

    function, args := stub.GetFunctionAndParameters() // get function name and args

    switch function {
    case "createArt":
        // Art artefact is created
        return c.createArt(stub, args)
    case "buyArt":
        // A market bought an Art
        return c.updateStatus(stub, args, "bought")
    case "sellArt":
        // A market sold an Art
        return c.updateStatus(stub, args, "sold")
    case "queryStock":
        // Stock query
        return c.queryStock(stub, args)
    case "queryDetail":
        // Get details of a computer
        return c.queryDetail(stub, args)
    default:
        return shim.Error("Available functions: createArt, buyArt, sellArt, queryStock, queryDetail")
    }
}

// createArt puts an available Art in the Blockchain
func (c *ArtXchg) createArt(stub shim.ChaincodeStubInterface, args []string) pb.Response {

    if len(args) != 3 {
        return shim.Error("createArt arguments usage: Serialnumber, Type, Genre")
    }

    // A newly created Art is available
    art := ART{args[0], args[1], args[2], "available"}

    // Use JSON to store in the Blockchain
    artAsBytes, err := json.Marshal(art)

    if err!=nil {
        return shim.Error(err.Error())
    }

    // Use serial number as key
    err = stub.PutState(art.Snumber, artAsBytes)

    if err != nil {
        return shim.Error(err.Error())
    }
    return shim.Success(nil)
}

// updateStatus handles sell and buy
func (c *ArtXchg) updateStatus(stub shim.ChaincodeStubInterface, args []string, status string) pb.Response {
    if len(args) != 1 {
        return shim.Error("This function needs the serial number as argument")
    }

    // Look for the serial number
    v, err := stub.GetState(args[0])
    if err != nil {
        return shim.Error("Serialnumber " + args[0] + " not found ")
    }

    // Get Information from Blockchain
    var art ART
    // Decode JSON data
    json.Unmarshal(v, &art)

    // Change the status
    art.Status = status
    // Encode JSON data
    artAsBytes, err := json.Marshal(art)

    // Store in the Blockchain
    err = stub.PutState(art.Snumber, artAsBytes)
    if err != nil {
        return shim.Error(err.Error())
    }
    return shim.Success(nil)
}

// queryStock gives all stored keys in the database
func (c *ArtXchg) queryStock(stub shim.ChaincodeStubInterface, args []string) pb.Response {

    // See stub.GetStateByRange in interfaces.go
    start, end := "",""

    if len(args) == 2 {
        start, end = args[0], args[1]
    } 

    // resultIterator is a StateQueryIteratorInterface
    resultsIterator, err := stub.GetStateByRange(start, end)
    if err != nil {
        return shim.Error(err.Error())
    }
    defer resultsIterator.Close()

    keys := " \n"
    // This interface includes HasNext,Close and Next
    for resultsIterator.HasNext() {
        queryResponse, err := resultsIterator.Next()
        if err != nil {
            return shim.Error(err.Error())
        }
        keys += queryResponse.Key + " \n"
    }

    fmt.Println(keys)

    return shim.Success([]byte(keys))
}

// queryDetail gives all fields of stored data and needs the serial number
func (c *ArtXchg) queryDetail(stub shim.ChaincodeStubInterface, args []string) pb.Response {

    // Look for the serial number
    value, err := stub.GetState(args[0])
    if err != nil {
            return shim.Error("Serial number " + args[0] +" not found")
        }

    var art ART
    // Decode value
    json.Unmarshal(value, &art)

    fmt.Print(art)
    // Response info
    return shim.Success([]byte(" SNMBR: " + art.Snumber + " Type: " + art.ArtType + " Genre: " + art.ArtGenre + " Status: " + art.Status))
}

func main() {
    err := shim.Start(new(ArtXchg))
    if err != nil {
        fmt.Printf("Error starting chaincode sample: %s", err)
    }
}
