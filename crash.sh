#!/bin/bash
docker exec openldap ldapsearch -H ldap://localhost:1389 -LLL -x -s sub -b "dc=example,dc=net" '(&(objectClass=inetOrgPerson)(memberof=cn=readers,ou=users,dc=example,dc=net))'
