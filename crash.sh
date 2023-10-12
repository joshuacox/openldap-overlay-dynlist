#!/bin/bash
set -eux

# if on the memberOf branch where the memberOf overlay is also enabled these two lines no longer crash
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' '(&(objectClass=inetOrgPerson)(memberof=cn=readers,ou=users,dc=example,dc=net))'
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' 'cn=customuser' memberof

# this line now returns nothing but does not crash the server
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'dc=example,dc=net' 'cn=Dynamic Group' memberOf

# this will still crash the server
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b 'cn=Dynamic Group,ou=Groups,dc=example,dc=net' 'member=blah'
