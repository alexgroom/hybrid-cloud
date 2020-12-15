#!/bin/bash

url=$1/api/send-request
count=1

while true; do 
    curl -s -H "Content-Type: application/json" \
        -X POST \
        -d'{"text": "World", "uppercase": false, "reverse": false}' \
        ${url}
    echo "Message ${count} Sent..."
    count=$(($count + 1))
done