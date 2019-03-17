#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Log Viewer
# This files check if all user configuration requirements are met
# ==============================================================================

# Require username / password
if ! bashio::config.true 'leave_front_door_open'; then
    bashio::config.require.username

    if bashio::config.true 'i_like_to_be_pwned'; then
        bashio::config.require.password
    else
        bashio::config.require.safe_password
    fi
fi

# Check SSL requirements, if enabled
bashio::config.require.ssl
