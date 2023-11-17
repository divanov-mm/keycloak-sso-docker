# keycloak-sso-docker
Quickly spin up a Keycloak instance with preloaded SAML configuration and keys.

## Prerequisites
- Generate a temp certificate for the "saml.signing.private.key" in the realm-export.json
```json
  ...
  "saml.signing.private.key": "<private_key>"
  ...
```

- Add admin name and password in the Dockerfile
```Dockerfile
ENV KEYCLOAK_ADMIN <admin_name>
ENV KEYCLOAK_ADMIN_PASSWORD <admin_password>
```
- Add hostname and hostname admin url (public IP/FQDN) in the Dockerfile
```Dockerfile
ENV KC_HOSTNAME=<hostname>
ENV KC_HOSTNAME_ADMIN_URL=https://<hostname>
```

## Build docker image

```sh
$ docker build -t keycloak-dev .
```

## Start a container

```sh
$ docker run -p 8080:8080 keycloak-dev
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
- A generic `localhost:8000` SAML client is defined with the base configuration. You may have to change urls/ports to fit your environment.
