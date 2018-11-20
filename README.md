# About

-   This image contains the meetecho janus webrtc gateway  ([https://github.com/meetecho/janus-gateway](https://github.com/meetecho/janus-gateway))

-   It uses the google stun server

## Limitations

Disables RabbitMQ and MQTT

## Build

`docker build -t docker-janus-webrtc-gateway -f Dockerfile .`

## Run

`docker run --rm --name janus --network=host docker-janus-webrtc-gateway`
