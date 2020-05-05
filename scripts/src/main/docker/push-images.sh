
# shellcheck disable=SC2164
cd ../../api

for directory in *; do
 docker push "abninder/${directory}":latest
done
