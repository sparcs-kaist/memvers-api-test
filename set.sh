docker cp ./people.ldif ldap-server:/people.ldif
docker exec ldap-server ldapadd -D "cn=admin,dc=sparcs,dc=org" -w admin -f /people.ldif
docker exec ldap-server rm /people.ldif

docker cp ./wheel.ldif ldap-server:/wheel.ldif
docker exec ldap-server ldapadd -D "cn=admin,dc=sparcs,dc=org" -w admin -f /wheel.ldif
docker exec ldap-server ldappasswd -D "cn=admin,dc=sparcs,dc=org" -w admin -s wheel -S "uid=wheel,ou=People,dc=sparcs,dc=org"
docker exec ldap-server rm /wheel.ldif

echo "create database nugu" | docker exec -i mysql-server mysql -hlocalhost -uroot -proot
docker exec -i mysql-server mysql -hlocalhost -uroot -proot nugu < ./nugu.sql

docker exec memvers-api-server service postfix start
