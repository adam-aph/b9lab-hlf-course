export FABRIC_CFG_PATH=./

configtxgen -profile ARTXCHGOrdererGenesis -outputBlock ./orderer/genesis.block

configtxgen -profile Org1Channel -outputCreateChannelTx ./channels/Org1.tx -channelID org1
configtxgen -profile Org2Channel -outputCreateChannelTx ./channels/Org2.tx -channelID org2

configtxgen -profile Org1Channel -outputAnchorPeersUpdate ./channels/org1anchor.tx -channelID org1 -asOrg Org1MSP
configtxgen -profile Org2Channel -outputAnchorPeersUpdate ./channels/org2anchor.tx -channelID org2 -asOrg Org2MSP

configtxgen -profile Org1Channel -outputAnchorPeersUpdate ./channels/marketanchororg1.tx -channelID org1 -asOrg ArtMarketMSP
configtxgen -profile Org2Channel -outputAnchorPeersUpdate ./channels/marketanchororg2.tx -channelID org2 -asOrg ArtMarketMSP
