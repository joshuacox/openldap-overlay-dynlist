#!/bin/bash
set -eux
./clean.sh
docker compose up -d
sleep 1
docker exec openldap mkdir -p /tmp/slapd.d
docker exec openldap mkdir -p /tmp/slapd-min.d
docker exec openldap slaptest -f /slaptest/slapd.conf -F /tmp/slapd.d
docker exec openldap slaptest -f /slaptest/slapd-min.conf -F /tmp/slapd-min.d
docker exec openldap slapcat -n0 -F /tmp/slapd.d > /tmp/cat1
docker exec openldap slapcat -n0 -F /tmp/slapd-min.d > /tmp/cat2
