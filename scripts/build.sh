#!/bin/bash
scripts_dir=$(dirname "$0")
project_dir="$scripts_dir/../"

# build the app
echo "start app building"
$scripts_dir/docker-run.sh

# clear build shit
echo "clearing cache"
sudo rm -rf "$project_dir/out/" "$project_dir/build/" "$project_dir/run.spec"

# create archive
cd "$project_dir"
echo "creating throttled.zip"
rm throttled.zip &> /dev/null
mkdir throttled
cp static/* throttled
cp dist/run throttled/throttled.bin
zip throttled.zip -r throttled
rm -rf throttled