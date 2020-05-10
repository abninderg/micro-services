
repo="$1"

# shellcheck disable=SC2164
cd ../../api

for directory in *; do
 sudo docker build ./"${directory}" -t "${repo}/${directory}:latest"
done
