#!/usr/bin/env bash

# MAC and IP address of the device you want to power on
# TARGET_MAC="AA:BB:CC:DD:EE:FF"
# TARGET_IP="192.168.1.1"

# Maximum number of attempts to check if the host is online after sending magic packet (MAX_TRIES * 5 sec = total wait time)
# MAX_TRIES=12

# Ping interval in seconds - for checking if host is still online
# PING_INTERVAL=60

# ^ These were used before, but now I use environment variables, so these are for testing only ^

# Send the Magic Packet to the specified MAC address
wakeonlan "$TARGET_MAC"
echo "Magic Packet has been sent to: $TARGET_MAC"

# Wait for the host to become available
COUNTER=0
while ! ping "$TARGET_IP" -c1 -W1 &>/dev/null; do
    ((COUNTER++))
    if [ "$COUNTER" -eq "$MAX_TRIES" ]; then
        echo "Host $TARGET_IP did not turn on after $MAX_TRIES attempts!"
        exit 1
    fi
    echo "Host $TARGET_IP is offline, waiting (attempt $COUNTER/$MAX_TRIES)..."
    sleep 5
done

# Monitor host availability; if it becomes unreachable, stop the container
while ping -c1 -W1 "$TARGET_IP" &>/dev/null; do
    sleep "$PING_INTERVAL"
done
echo "$TARGET_IP is not responding, stopping container..."
exit 0