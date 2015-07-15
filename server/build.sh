cp ../../keycloak/distribution/server-dist/target/keycloak-1.6.0.Final-SNAPSHOT.tar.gz .
docker build --tag jboss/keycloak:1.6.0.Final-SNAPSHOT .
rm keycloak-1.6.0.Final-SNAPSHOT.tar.gz
