
# shellcheck disable=SC2164
cd ../../api

for directory in *; do
 docker push "${REPO}/${directory}":latest
done
