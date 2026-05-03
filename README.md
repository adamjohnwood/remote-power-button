# About

A Docker container that works as a Wake-on-LAN (WOL) button for your PC, monitoring the target machine and automatically stopping when it turns off.

## Features

- Sends a Wake-on-LAN packet to a specified computer in your network.

- Continuously pings the machine to check if it’s online.

- Automatically stops the container when the machine goes offline.

- Acts like a “Docker button” to turn your PC on or off.

- Optimized for use with CasaOS or similar platforms.

## Environment Variables

| Variable       | Description                                                                                                                | Default |
|----------------|----------------------------------------------------------------------------------------------------------------------------|---------|
| `TARGET_MAC`   | MAC address of the target computer to wake via WOL                                                                         | —       |
| `TARGET_IP`    | IP address or hostname to ping to check if the PC is online                                                                | —       |
| `PING_INTERVAL`| Ping interval in seconds - for checking if host is still online                                                            | 60      |
| `MAX_TRIES`    | Maximum number of attempts to check if the host is online after sending magic packet (MAX_TRIES * 5 sec = total wait time) | 12      |
