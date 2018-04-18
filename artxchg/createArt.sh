docker exec cli0.Org1 bash -c "peer chaincode invoke -C org1 -n artxchg -c '{\"Args\":[\"createArt\", \"PaintO1-001\", \"foo\", \"bar\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
docker exec cli0.Org1 bash -c "peer chaincode invoke -C org1 -n artxchg -c '{\"Args\":[\"createArt\", \"PaintO1-002\", \"foo\", \"bar\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
docker exec cli0.Org1 bash -c "peer chaincode invoke -C org1 -n artxchg -c '{\"Args\":[\"createArt\", \"PaintO1-003\", \"foo\", \"bar\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
docker exec cli0.Org1 bash -c "peer chaincode invoke -C org1 -n artxchg -c '{\"Args\":[\"createArt\", \"PaintO1-004\", \"foo\", \"bar\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"

docker exec cli0.Org2 bash -c "peer chaincode invoke -C org2 -n artxchg -c '{\"Args\":[\"createArt\", \"PaintO2-001\", \"foo\", \"bar\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
docker exec cli0.Org2 bash -c "peer chaincode invoke -C org2 -n artxchg -c '{\"Args\":[\"createArt\", \"PaintO2-002\", \"foo\", \"bar\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
docker exec cli0.Org2 bash -c "peer chaincode invoke -C org2 -n artxchg -c '{\"Args\":[\"createArt\", \"PaintO2-003\", \"foo\", \"bar\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
docker exec cli0.Org2 bash -c "peer chaincode invoke -C org2 -n artxchg -c '{\"Args\":[\"createArt\", \"PaintO2-004\", \"foo\", \"bar\"]}' \
	--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/artxchg.com/orderers/orderer.artxchg.com/msp/tlscacerts/tlsca.artxchg.com-cert.pem"
