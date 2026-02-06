FROM matrixdotorg/synapse:latest

# Copy config
COPY homeserver.yaml /data/homeserver.yaml
COPY log.config /data/log.config

# Pre-generate signing key
RUN python -m synapse.app.homeserver --config-path /data/homeserver.yaml --generate-keys || true

EXPOSE 8008

CMD ["python", "-m", "synapse.app.homeserver", "--config-path", "/data/homeserver.yaml"]
