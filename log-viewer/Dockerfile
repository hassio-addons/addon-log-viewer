ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy run script for add-on
COPY run.sh /

# Install requirements for add-on
RUN \
    apk add --no-cache git jq nodejs \
    \
    && chmod a+x /run.sh \
    \
    && npm i -g git+https://github.com/dale3h/ws-log.git

# Build arugments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Log Viewer" \
    io.hass.description="Browser-based log utility for Home Assistant" \
    io.hass.arch="armhf|aarch64|i386|amd64" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Dale Higgs <@dale3h>" \
    org.label-schema.description="Browser-based log utility for Home Assistant" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Log Viewer" \
    org.label-schema.schema-version="0.1.2" \
    org.label-schema.url="" \
    org.label-schema.usage="https://github.com/dale3h/hassio-addons/tree/master/log-viewer/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/dale3h/hassio-addons/tree/master/log-viewer" \
    org.label-schema.vendor="Dale's Hass.io Add-ons"

# Execute run script
CMD [ "/run.sh" ]
