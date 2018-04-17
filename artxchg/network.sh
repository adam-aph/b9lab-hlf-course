docker exec cli.ArtMarket bash -c 'peer channel create -c org1 -f ./channels/Org1.tx -o orderer.artxchg.com:7050 \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'
docker exec cli.ArtMarket bash -c 'peer channel create -c org2 -f ./channels/Org2.tx -o orderer.artxchg.com:7050 \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'

docker exec cli.ArtMarket bash -c 'peer channel join -b org1.block \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'
docker exec cli.ArtMarket bash -c 'peer channel join -b org2.block \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'

docker exec cli0.Org1 bash -c 'peer channel join -b org1.block \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'
docker exec cli0.Org2 bash -c 'peer channel join -b org2.block \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'

docker exec cli0.Org1 bash -c 'peer channel update -o orderer.artxchg.com:7050 -c org1 -f ./channels/org1anchor.tx \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'
docker exec cli0.Org2 bash -c 'peer channel update -o orderer.artxchg.com:7050 -c org2 -f ./channels/org2anchor.tx \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'
docker exec cli.ArtMarket bash -c 'peer channel update -o orderer.artxchg.com:7050 -c org1 -f ./channels/marketanchororg1.tx \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'
docker exec cli.ArtMarket bash -c 'peer channel update -o orderer.artxchg.com:7050 -c org2 -f ./channels/marketanchororg2.tx \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'

docker exec cli0.Org1 bash -c 'peer chaincode install -p artxchg -n artxchg -v 0 \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'
docker exec cli0.Org2 bash -c 'peer chaincode install -p artxchg -n artxchg -v 0 \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'
docker exec cli.ArtMarket bash -c 'peer chaincode install -p artxchg -n artxchg -v 0 \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem'

docker exec cli0.Org1 bash -c "peer chaincode instantiate -C org1 -n artxchg -v 0 -c '{\"Args\":[]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
docker exec cli0.Org2 bash -c "peer chaincode instantiate -C org2 -n artxchg -v 0 -c '{\"Args\":[]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
