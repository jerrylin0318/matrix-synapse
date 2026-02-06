FROM matrixdotorg/synapse:latest

# Copy config
COPY homeserver.yaml /data/homeserver.yaml
COPY log.config /data/log.config

# Render uses PORT env var
ENV PORT=8008

EXPOSE 8008

# Generate signing key if not exists, then start
CMD ["sh", "-c", "python -m synapse.app.homeserver --config-path /data/homeserver.yaml --generate-keys 2>/dev/null || true; python -m synapse.app.homeserver --config-path /data/homeserver.yaml"]
