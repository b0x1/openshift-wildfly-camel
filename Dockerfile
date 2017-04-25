FROM jboss/wildfly
LABEL "maintainer"="Boyang Xia / Gepardec IT Services (boyang.xia@gepardec.com)"


# Add Wildfly Camel Patch to the JBoss folder
# From Github
USER root

RUN cd $JBOSS_HOME \ 
    && curl -OL https://github.com/wildfly-extras/wildfly-camel/releases/download/4.6.0/wildfly-camel-patch-4.6.0.tar.gz \
    && tar xf wildfly-camel-patch-4.6.0.tar.gz \
    && rm wildfly-camel-patch-4.6.0.tar.gz \
    && chown -R jboss:0 ${JBOSS_HOME} && chmod -R ug+rw ${JBOSS_HOME}

# If file is local:
#ADD wildfly-camel-patch-4.6.0.tar.gz $JBOSS_HOME
#RUN chown -R jboss:0 ${JBOSS_HOME}


# Add example WARs (https://github.com/wildfly-extras/wildfly-camel-examples)
COPY example-camel-cdi-4.7.0-SNAPSHOT.war example-camel-cxf-jaxws-4.7.0-SNAPSHOT.war \
     example-camel-cxf-jaxrs-4.7.0-SNAPSHOT.war $JBOSS_HOME/standalone/deployments/

# EXPOSE should be redundant since port is exposed in base image
EXPOSE 8080

USER jboss
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-c", "standalone-camel.xml", "-b", "0.0.0.0"]
