#!/bin/bash
set -eux
./clean.sh
docker compose up -d
sleep 5

docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b "dc=example,dc=net"
exit 0
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b "dc=example,dc=net" "cn=customuser" uid memberof
docker exec openldap mkdir -p /tmp/slapd.d
docker exec openldap mkdir -p /tmp/slapd-min.d
docker exec openldap slaptest -f /slaptest/slapd.conf -F /tmp/slapd.d
docker exec openldap slaptest -f /slaptest/slapd-min.conf -F /tmp/slapd-min.d
docker exec openldap slapcat -n0 -F /tmp/slapd.d > /tmp/cat1
docker exec openldap slapcat -n0 -F /tmp/slapd-min.d > /tmp/cat2
