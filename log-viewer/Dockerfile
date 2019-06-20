ARG BUILD_FROM=hassioaddons/base:4.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install requirements for add-on
RUN \
    apk add --no-cache \
        lua-resty-http=0.13-r0 \
        nginx-mod-http-lua=1.16.0-r2 \
        nginx=1.16.0-r2 \
        nodejs=10.16.0-r0 \
        npm=10.16.0-r0 \
    \
    && apk add --no-cache --virtual .build-dependencies \
        git=2.22.0-r0 \
    \
    && npm set unsafe-perm true \
    \
    && VERSION="c5b60e75dab012bb5fb01096898c643fafe09bb5" \
    && npm -g i \
        "git+https://github.com/frenck/ws-log.git#${VERSION}" \
    \
    && apk del --no-cache --purge .build-dependencies \
    && rm -f -r /etc/nginx

# Copy root file system
COPY rootfs /

# Build arguments
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
    org.label-schema.url="https://community.home-assistant.io/t/community-hass-io-add-on-log-viewer/64377?u=dale3h" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-log-viewer/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-log-viewer/tree/master/log-viewer" \
    org.label-schema.vendor="Community Hass.io Addons"
