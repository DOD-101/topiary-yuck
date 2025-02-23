#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

export TOPIARY_CONFIG_FILE="${SCRIPT_DIR}/languages.ncl"
export TOPIARY_LANGUAGE_DIR="${SCRIPT_DIR}/languages/"

topiary "$@"
