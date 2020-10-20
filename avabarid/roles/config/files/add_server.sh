#!/bin/bash

USERNAME=$1 #"ArshiA"
PASSWORD=$2 #"as12AS!@"
HOST_NAME=$3 #"success"
HOST_IP=$4 #"172.16.14.2"
HOST_SSH_PORT=$5 #"22"

response=$(curl --location --request GET 'bastillion.pegah.tech' | grep csrf)
csrf=$(echo "$response" | sed 's/^.*_csrf=\(.*\)".*$/\1/')
cookie=$(echo "$response" | sed 's/^.*jsessionid=\(.*\)?.*$/\1/')

csrf=$(curl --location --request POST 'https://bastillion.pegah.tech/loginSubmit.ktrl' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header "Cookie: JSESSIONID=$cookie" \
--data-urlencode "auth.username=$USERNAME" \
--data-urlencode "auth.password=$PASSWORD" \
--data-urlencode "_csrf=$csrf" | grep csrf | head -n1 | sed 's/^.*_csrf=\(.*\)".*$/\1/')

curl --location --request POST 'https://bastillion.pegah.tech/manage/saveSystem.ktrl' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header "Cookie: JSESSIONID=$cookie" \
--data-urlencode "_csrf=$csrf" \
--data-urlencode "hostSystem.displayNm=$HOST_NAME" \
--data-urlencode 'hostSystem.user=root' \
--data-urlencode "hostSystem.host=$HOST_IP" \
--data-urlencode "hostSystem.port=$HOST_SSH_PORT" \
--data-urlencode 'hostSystem.authorizedKeys=~/.ssh/authorized_keys' \
--data-urlencode 'sortedSet.orderByDirection=asc' \