FROM alpine:latest

# Install required packages
RUN apk add --no-cache \
    bash \
    iputils \
    wakeonlan

WORKDIR /app

# MAC and IP address of the device you want to power on
ENV TARGET_MAC="AA:BB:CC:DD:EE:FF"
ENV TARGET_IP="192.168.1.1"

# Maximum number of attempts to check if the host is online after sending magic packet (MAX_TRIES * 5 sec = total wait time)
ENV MAX_TRIES=12

# Ping interval in seconds - for checking if host is still online
ENV PING_INTERVAL=60

COPY script.sh ./script.sh

RUN chmod +x ./script.sh

CMD ["/app/script.sh"]