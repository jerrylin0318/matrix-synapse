#!/bin/bash
set -e

# Generate signing key if not exists
if [ ! -f /data/signing.key ]; then
    python -m synapse.app.homeserver --config-path /data/homeserver.yaml --generate-keys
fi

# Start synapse
exec python -m synapse.app.homeserver --config-path /data/homeserver.yaml
