docker exec cli.ArtMarket bash -c 'peer channel create -c org1 -f ./channels/Org1.tx -o orderer0.artxchg2.com:7050 --timeout 30'
docker exec cli.ArtMarket bash -c 'peer channel create -c org2 -f ./channels/Org2.tx -o orderer1.artxchg2.com:7050 --timeout 30'

docker exec cli.ArtMarket bash -c 'peer channel join -b org1.block'
docker exec cli.ArtMarket bash -c 'peer channel join -b org2.block'

docker exec cli0.Org1 bash -c 'peer channel join -b org1.block'
docker exec cli0.Org2 bash -c 'peer channel join -b org2.block'
docker exec cli1.Org1 bash -c 'peer channel join -b org1.block'
docker exec cli1.Org2 bash -c 'peer channel join -b org2.block'
docker exec cli0.Org3 bash -c 'peer channel join -b org2.block'

docker exec cli0.Org1 bash -c 'peer channel update -o orderer0.artxchg2.com:7050 -c org1 -f ./channels/org1anchor.tx'
docker exec cli0.Org2 bash -c 'peer channel update -o orderer1.artxchg2.com:7050 -c org2 -f ./channels/org2anchor.tx'
docker exec cli.ArtMarket bash -c 'peer channel update -o orderer2.artxchg2.com:7050 -c org1 -f ./channels/marketanchororg1.tx'
docker exec cli.ArtMarket bash -c 'peer channel update -o orderer0.artxchg2.com:7050 -c org2 -f ./channels/marketanchororg2.tx'

docker exec cli0.Org1 bash -c 'peer chaincode install -p artxchg2 -n artxchg2 -v 0'
docker exec cli0.Org2 bash -c 'peer chaincode install -p artxchg2 -n artxchg2 -v 0'
docker exec cli0.Org3 bash -c 'peer chaincode install -p artxchg2 -n artxchg2 -v 0'
docker exec cli.ArtMarket bash -c 'peer chaincode install -p artxchg2 -n artxchg2 -v 0'

docker exec cli0.Org1 bash -c "peer chaincode instantiate -C org1 -n artxchg2 -v 0 -c '{\"Args\":[]}'"
docker exec cli0.Org2 bash -c "peer chaincode instantiate -C org2 -n artxchg2 -v 0 -c '{\"Args\":[]}'"
