FROM quay.io/keycloak/keycloak:22.0.4 as keycloak_base

ENV KEYCLOAK_ADMIN admin
ENV KEYCLOAK_ADMIN_PASSWORD admin

COPY realm-export.json /opt/keycloak_import/
VOLUME /opt/keycloak/data/h2

# Import realm settings and keys
RUN /opt/keycloak/bin/kc.sh import --file /opt/keycloak_import/realm-export.json

# The Keycloak server is configured to listen on port 8080
EXPOSE 8080
EXPOSE 8443

# Import the realm on start-up
CMD ["start-dev"]
