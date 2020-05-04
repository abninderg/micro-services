#!/bin/bash

# shellcheck disable=SC2164
cd ../../api

for directory in *; do
 docker build ./"${directory}" -t "${directory}"
done
