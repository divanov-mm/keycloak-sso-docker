# keycloak-sso-docker
Quickly spin up a Keycloak instance with preloaded SAML configuration and keys.

## Build docker image

```sh
$ docker build -t keycloak-dev .
```

## Start a container

```sh
$ docker run -p 8080:8080 keycloak-dev
```

NOTE: We're creating a volume so further Keycloak configuration is persisted between builds.

## Useful tips
- Make sure you select the "SSO" realm before inspecting/changing the configuration.
- A generic `localhost:8000` SAML client is defined with the base configuration. You may have to change urls/ports to fit your environment.
