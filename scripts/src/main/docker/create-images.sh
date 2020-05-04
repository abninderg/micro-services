
# shellcheck disable=SC2164
cd "${WORKSPACE}"/microservices/target/api

for directory in *; do
 docker build ./"${directory}" -t "${directory}"
done
