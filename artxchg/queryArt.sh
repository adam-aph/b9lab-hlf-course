docker exec cli.ArtMarket bash -c "peer chaincode query -C org1 -n artxchg -c '{\"Args\":[\"queryStock\"]}'"
docker exec cli.ArtMarket bash -c "peer chaincode query -C org2 -n artxchg -c '{\"Args\":[\"queryStock\"]}'"
