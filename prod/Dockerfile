FROM quay.io/keycloak/keycloak:latest as keycloak_base

ENV KC_HOSTNAME_STRICT_HTTPS=true
ENV KC_PROXY=edge

COPY realm-export.json /opt/keycloak_import/
COPY certificates /certificates

VOLUME /opt/keycloak/data/h2

# Import realm settings and keys
RUN /opt/keycloak/bin/kc.sh import --file /opt/keycloak_import/realm-export.json

# Switch to root user to change permissions
USER root

# Change permissions for certificate files
RUN chmod 644 /certificates/key.pem /certificates/cert.pem

# Switch back to the default user
USER 1000

EXPOSE 8443

# Import the realm on start-up
CMD ["start", "--features=token-exchange", "--https-certificate-key-file=/certificates/key.pem", "--https-certificate-file=/certificates/cert.pem"]
#ENTRYPOINT ["/bin/sh"]
