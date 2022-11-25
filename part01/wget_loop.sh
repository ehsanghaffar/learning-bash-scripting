#!/bin/bash
# bash script for download a file in loop

file_url="http://example/file.txt"

COUNT=0

while [ $COUNT -lt 10 ]; do
  wget $file_url
  sleep 120
  COUNT=$((COUNT + 1))
done
