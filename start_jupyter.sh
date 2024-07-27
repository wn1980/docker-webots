#!/usr/bin/env bash

set -e

export WEBOTS_HOME=/usr/local/webots

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${WEBOTS_HOME}/lib:${WEBOTS_HOME}/lib/controller
export PYTHONPATH=${PYTHONPATH}:${WEBOTS_HOME}/lib/python:${WEBOTS_HOME}/lib/controller/python
export PYTHONIOENCODING=UTF-8

export AUDIODEV=null
export DEBIAN_FRONTEND=noninteractive

${WEBOTS_HOME}/webots &

cd /webots_space && jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.root_dir=''
