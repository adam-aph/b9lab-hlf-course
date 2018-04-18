docker exec cli.ArtMarket bash -c "peer chaincode query -C org1 -n artxchg -c '{\"Args\":[\"queryStock\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
docker exec cli.ArtMarket bash -c "peer chaincode query -C org2 -n artxchg -c '{\"Args\":[\"queryStock\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
