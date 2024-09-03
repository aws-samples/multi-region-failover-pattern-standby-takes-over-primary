#!/bin/bash

url=https://example.com

while true; do
  current_time=$(date +"%T")
  echo "[$current_time] Sending requests ..."
  curl "$url"
  echo -e ""
  echo -e "----------------------------------------"
  sleep 5
done
