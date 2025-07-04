#!/bin/bash
#
# Usage: raise-all-market-products.sh <version>
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "$workDir" ]; then
  workDir=$(mktemp -d -t projectConvertXXX)
fi

if [ -z "$gitDir" ]; then
  gitDir="$DIR/repos"
  echo $(mkdir -v -p $DIR/repos)
fi

convert_to_version=$1

source "$DIR/repo-migrator.sh"