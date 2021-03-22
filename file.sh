#!/bin/bash

TOKEN="0000000000:AAEH0000000000000000000000000000"
CHAT_ID="0000000000"

file1='/home/bs/test.jpg'

image1="attach://"$(basename $file1)

curl -s -X POST -F media='[{"type":"photo","media":"'$image1'"}]' \
    -F "$(basename $file1)=@${file1}" -H "Content-Type:multipart/form-data" \
    "https://api.telegram.org/bot$TOKEN/sendMediaGroup?chat_id=$CHAT_ID"
