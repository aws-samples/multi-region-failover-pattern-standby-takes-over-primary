#!/bin/bash

url=https://example.com

while true; do
  current_time=$(date +"%T")
  RESP=$(curl -s $url)
  echo -e "[$current_time] $RESP"

  sleep 5
done
