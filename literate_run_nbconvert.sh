#!/bin/bash -x

jupyter nbconvert  --to script "$1" --config literate_config.py --template=literate.tpl --Application.log_level='DEBUG'


outputname=$(basename "$1" .ipynb)
outputpath=${1%.ipynb}
