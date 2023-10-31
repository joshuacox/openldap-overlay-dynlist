#!/bin/bash
# all of these are known to crash the slapd server
set -eux
#docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' '(&(objectClass=inetOrgPerson)(memberof=cn=readers,ou=users,dc=example,dc=net))'
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' 'cn=customuser' memberof
#docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' 'cn=customuser2' memberof
#docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' 'cn=Dynamic Group' member
#docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' 'cn=Dynamic Group'
#docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' 'cn=Dynamic List'
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'cn=Dynamic Group,ou=Groups,dc=example,dc=net' member
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'cn=Dynamic List,ou=Groups,dc=example,dc=net' member
#docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'cn=Dynamic Group,ou=Groups,dc=example,dc=net' 'member=blah'
