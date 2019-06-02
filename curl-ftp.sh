#!/bin/bash -eu

[[ ! -z "${DEBUG}" ]] && ${DEBUG} && set -x

FILE_LIST=$(find $1 -type f -not -name '.DS_Store')
DELETE_PATH=${1%/*}

for file_path in $FILE_LIST;
do
  ftp_path="$2${file_path/$DELETE_PATH/}";
  curl -T $file_path --ftp-create-dirs $ftp_path;
done

