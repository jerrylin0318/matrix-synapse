FROM matrixdotorg/synapse:latest

# Copy config
COPY homeserver.yaml /data/homeserver.yaml
COPY log.config /data/log.config

# Pre-generate signing key
RUN python -m synapse.app.homeserver --config-path /data/homeserver.yaml --generate-keys || true

EXPOSE 8008

# Override entrypoint and use direct command
ENTRYPOINT ["python", "-m", "synapse.app.homeserver"]
CMD ["--config-path", "/data/homeserver.yaml"]
