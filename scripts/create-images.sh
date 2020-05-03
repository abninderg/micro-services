cd ./accounts-api
docker build . -t accounts-api

cd ../addresses-api
docker build . -t address-api

cd ../discovery
docker build . -t discovery

cd ../gateway
docker build . -t gateway

cd ../config-server
docker build . -t config-server

cd ..
docker-compose up
