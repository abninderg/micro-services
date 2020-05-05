
repo="$1"

# shellcheck disable=SC2164
cd ../../api

for directory in *; do
 docker build ./"${directory}" -t "${repo}/${directory}:latest"
done
