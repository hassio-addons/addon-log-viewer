ARG BUILD_FROM=hassioaddons/base:2.1.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install requirements for add-on
RUN \
    apk add --no-cache \
        nodejs=8.11.3-r1 \
        npm=8.11.3-r1 \
    \
    && apk add --no-cache --virtual .build-dependencies \
        git=2.18.0-r0 \
    \
    && npm set unsafe-perm true \
    \
    && VERSION="ebd0328431c491bf5b172dab6f9eca89f5a2299a" \
    && npm -g i \
        "git+https://github.com/dale3h/ws-log.git#${VERSION}" \
    \
    && apk del --purge .build-dependencies

# Copy root file system
COPY rootfs /

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Log Viewer" \
    io.hass.description="Browser-based log utility for Hass.io" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Dale Higgs <@dale3h>" \
    org.label-schema.description="Browser-based log utility for Hass.io" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Log Viewer" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-log-viewer/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-log-viewer/tree/master/log-viewer" \
    org.label-schema.vendor="Community Hass.io Addons"
