#!/bin/env bash


cd $(dirname $0)
DIR=$(pwd)

echo "create symlinks"
for i in $(ls -1 | grep -v conf.sh); do echo "create link for $i" && echo ln -sf ${DIR}/${i} ~/.$i && ln -sf ${DIR}/${i} ~/.$i; done
exit 0;

