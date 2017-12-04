#!/bin/bash

API_KEY=`cat ~/api_key`

if [ -z $2 ]; then
  echo "detux.org: API Client Interface v1.0"
  echo "Usage $0 SHA|file|search string report|search|submit";
  exit;
fi

echo "Using API $API_KEY";

if [ $2 = "report" ]; then
  echo "SHA256: $1";
  curl --request POST 'https://detux.org/api/report.php' --data "api_key=$API_KEY&sha256=$1"
fi

if [ $2 = "search" ]; then
  echo "Search: $1";
  curl --request POST 'https://detux.org/api/search.php' --data "api_key=$API_KEY&search=$1"
fi

if [ $2 = "submit" ]; then
  echo "File: $1";
  curl --request POST 'https://detux.org/api/submit.php' --data "api_key=$API_KEY&file=$1=&private=0"
fi
