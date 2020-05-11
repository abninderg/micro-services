DOCKER_HUB_REPO="$1"
if [ -z "${DOCKER_HUB_REPO}" ]; then
  DOCKER_HUB_REPO="abninder"
fi

# shellcheck disable=SC2164
cd ../../api

for directory in *; do
  docker push "${DOCKER_HUB_REPO}/${directory}":latest
done
