#!/bin/bash
# all of these are known to crash the slapd server
set -eux
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' '(&(objectClass=inetOrgPerson)(memberof=cn=readers,ou=users,dc=example,dc=net))'
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' 'cn=customuser' memberof
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' 'cn=Dynamic Group' memberOf
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'cn=Dynamic Group,ou=Groups,dc=example,dc=net' 'member=blah'
