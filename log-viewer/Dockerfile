ARG BUILD_FROM=hassioaddons/base:8.0.5
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install requirements for add-on
RUN \
    apk add --no-cache \
        lua-resty-http=0.15-r0 \
        nginx-mod-http-lua=1.18.0-r1 \
        nginx=1.18.0-r1 \
        nodejs=12.18.3-r0 \
        npm=12.18.3-r0 \
    \
    && apk add --no-cache --virtual .build-dependencies \
        git=2.26.2-r0 \
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
    io.hass.description="Browser-based log utility for Home Assistant" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Dale Higgs <@dale3h>" \
    org.opencontainers.image.title="Log Viewer" \
    org.opencontainers.image.description="Browser-based log utility for Home Assistant" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="Dale Higgs <@dale3h>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/hassio-addons/addon-log-viewer" \
    org.opencontainers.image.documentation="https://github.com/hassio-addons/addon-log-viewer/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
