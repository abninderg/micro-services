DOCKER_COMPOSE_DIR="$1"

sudo docker login --username=abninder --password=liverpool01
sudo curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo chmod 777 /var/run/docker.sock

# shellcheck disable=SC2164
cd "${DOCKER_COMPOSE_DIR}"

docker-compose down
COMPOSE_HTTP_TIMEOUT=200 docker-compose up