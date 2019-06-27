#!/bin/bash

increment_ver() {
  echo $SEMVER | awk -F. -v a="$1" -v b="$2" -v c="$3" '{printf("%d.%d.%d", $1+a, $2+b , $3+c)}'
}

bump() {
  echo "${PREFIX}$(increment_ver "$1" "$2" "$3")"
}

usage() {
  echo "Usage: bump [-p prefix] -v \"v0.0.0\" {major|minor|patch}"
  echo "Bump semantic version"
  echo
  echo "Options:"
  echo "  -p  prefix [to be] used for the semver tags."
  echo "  -v  current semver."
  exit 1
}

while getopts :p:v: opt; do
  case $opt in
    p) PREFIX="$OPTARG";;
    v) SEMVER="$SEMVER";;
    \?) usage;;
    :) echo "option -$OPTARG requires an argument"; exit 1;;
  esac
done
shift $((OPTIND-1))

case $1 in
  major) bump 1 0 0;;
  minor) bump 0 1 0;;
  patch) bump 0 0 1;;
  *) usage
esac