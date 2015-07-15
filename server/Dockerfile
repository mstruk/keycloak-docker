FROM jboss/base-jdk:8

ENV KEYCLOAK_VERSION 1.6.0.Final-SNAPSHOT
# Enables signals getting passed from startup script to JVM
# ensuring clean shutdown when container is stopped.
ENV LAUNCH_JBOSS_IN_BACKGROUND 1

USER root

#RUN yum install -y epel-release && yum install -y jq && yum clean all

USER jboss

# .tar.gz gets automatically unpacked
ADD keycloak-1.6.0.Final-SNAPSHOT.tar.gz /opt/jboss/

RUN cd /opt/jboss && mv /opt/jboss/keycloak-$KEYCLOAK_VERSION /opt/jboss/keycloak

USER root

ADD setLogLevel.xsl /opt/jboss/keycloak/
RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone.xml -xsl:/opt/jboss/keycloak/setLogLevel.xsl -o:/opt/jboss/keycloak/standalone/configuration/standalone.xml

RUN chown -R jboss:jboss /opt/jboss
USER jboss

ENV JBOSS_HOME /opt/jboss/keycloak

EXPOSE 8080

CMD ["/opt/jboss/keycloak/bin/standalone.sh", "-b", "0.0.0.0"]
