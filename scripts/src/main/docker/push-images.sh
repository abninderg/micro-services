repo="$1"

# shellcheck disable=SC2164
cd ../../api

for directory in *; do
 docker push "${repo}/${directory}":latest
done
