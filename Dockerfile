FROM matrixdotorg/synapse:latest

# Copy config and startup script
COPY homeserver.yaml /data/homeserver.yaml
COPY log.config /data/log.config
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8008

CMD ["/start.sh"]
