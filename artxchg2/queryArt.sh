docker exec cli.ArtMarket bash -c "peer chaincode query -C org1 -n artxchg2 -c '{\"Args\":[\"queryStock\"]}'"
docker exec cli.ArtMarket bash -c "peer chaincode query -C org2 -n artxchg2 -c '{\"Args\":[\"queryStock\"]}'"
