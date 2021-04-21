FROM jboss/wildfly:22.0.1.Final

ENV WILDFLY_HOME /opt/jboss/wildfly
ENV DEPLOY_DIR ${WILDFLY_HOME}/standalone/deployments/

ENV DATASOURCE_NAME AppDS
ENV DATASOURCE_JNDI java:/AppDS

ENV DB_HOST database
ENV DB_PORT 5432
ENV DB_USER userEntity
ENV DB_PASS password
ENV DB_NAME dbname

# create temporary deployment dir, because wars can deploy after the datasource is created
RUN mkdir /tmp/deploments
ENV DEPLOY_DIR /tmp/deploments

RUN mkdir /tmp/jboss-cli
ENV CLI_DIR /tmp/jboss-cli

COPY startWithPostgres.sh $WILDFLY_HOME/bin

USER root
RUN chown jboss:jboss $WILDFLY_HOME/bin/startWithPostgres.sh
RUN chmod 755 $WILDFLY_HOME/bin/startWithPostgres.sh
USER jboss

COPY postgresql-42.2.18.jar /tmp

ENTRYPOINT $WILDFLY_HOME/bin/startWithPostgres.sh
