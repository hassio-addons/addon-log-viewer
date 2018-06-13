ARG BUILD_FROM=hassioaddons/base-amd64:1.4.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Install requirements for add-on
RUN \
    apk add --no-cache \
        nodejs=8.9.3-r1 \
    \
    && apk add --no-cache --virtual .build-dependencies \
        git=2.15.2-r0 \
    \
    && npm set unsafe-perm true \
    \
    && npm -g install \
        git+https://github.com/dale3h/ws-log.git \
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
    io.hass.description="Browser-based log utility for Hass.io (Home Assistant)" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Dale Higgs <@dale3h>" \
    org.label-schema.description="Browser-based log utility for Hass.io (Home Assistant)" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Log Viewer" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-log-viewer/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-log-viewer/tree/master/log-viewer" \
    org.label-schema.vendor="Dale's Hass.io Add-ons"
