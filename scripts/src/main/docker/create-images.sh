
# shellcheck disable=SC2164
cd ~/.jenkins/"${WORKSPACE}"/microservices/target/api

for directory in *; do
 docker build ./"${directory}" -t "${directory}"
done
