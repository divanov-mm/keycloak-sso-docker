# keycloak-sso-docker
Quickly spin up a Keycloak instance with preloaded SAML configuration and keys.

## Build docker image

```sh
docker build -t keycloak-sso .
```

## Start a container

- For development
```sh
docker run -p 8080:8080 keycloak-sso
```

- For stage/production
NOTE: make sure your host has these env variables set
```sh
docker run -e KEYCLOAK_ADMIN=$KEYCLOAK_ADMIN \
    -e KEYCLOAK_ADMIN_PASSWORD=$KEYCLOAK_ADMIN_PASSWORD \
    -e KC_HOSTNAME=$KC_HOSTNAME \
    -e KC_HOSTNAME_ADMIN_URL=$KC_HOSTNAME_ADMIN_URL \
    -p 8443:8443 keycloak-sso
```

## Regenerate private key and certificates
- Follow these steps and generate private key and certificate - https://medium.com/keycloak/running-keycloak-with-tls-self-signed-certificate-d8da3e10c544
- When you create them move them in certificates/ folder in the following format
```bash
certificates/key.pem
certificates/cert.pem
```

NOTE: We're creating a volume so further Keycloak configuration is persisted between builds.

## Useful tips
- Make sure you select the "SSO" realm before inspecting/changing the configuration.
- A generic `localhost:3003` SAML client is defined with the base configuration. You may have to change urls/ports to fit your environment.
