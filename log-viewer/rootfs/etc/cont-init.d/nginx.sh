#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Log Viewer
# Configures NGINX
# ==============================================================================

# Generate Ingress configuration
bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    | tempio \
        -template /etc/nginx/templates/ingress.gtpl \
        -out /etc/nginx/servers/ingress.conf

# Generate direct access configuration, if enabled.
if bashio::var.has_value "$(bashio::addon.port 80)"; then
    bashio::config.require.ssl
    bashio::var.json \
        certfile "$(bashio::config 'certfile')" \
        keyfile "$(bashio::config 'keyfile')" \
        leave_front_door_open "^$(bashio::config 'leave_front_door_open')" \
        ssl "^$(bashio::config 'ssl')" \
        | tempio \
            -template /etc/nginx/templates/direct.gtpl \
            -out /etc/nginx/servers/direct.conf
fi
