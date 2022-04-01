./docker/build.sh
./docker/run.sh dvc list git@github.com:iterative/example-get-started.git  --verbose
# https works just fine
# ./docker/run.sh dvc list https://github.com/iterative/example-get-started.git  --verbose
./docker/run.sh dvc doctor --verbose