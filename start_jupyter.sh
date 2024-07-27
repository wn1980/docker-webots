#!/bin/bash

export WEBOTS_HOME=/usr/local/webots
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${WEBOTS_HOME}/lib:${WEBOTS_HOME}/lib/controller
export PYTHONPATH=${PYTHONPATH}:${WEBOTS_HOME}/lib/python:${WEBOTS_HOME}/lib/controller/python
export PYTHONIOENCODING=UTF-8

cd /webots_data && jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.notebook_dir='notebooks'
