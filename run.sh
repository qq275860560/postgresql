#!/bin/bash
set -xev
source /etc/profile
#
echo "当前目录"
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
echo ${SHELL_FOLDER}
cd ${SHELL_FOLDER}
#

#(git add src README.md  || true) && (git commit -m "commit" || true) && git push

docker build -t qq275860560/postgresql .