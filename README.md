# Personal Docker Images
A collection of Docker images to serve different purposes

## [Radio](radio)
Service intended to run as an internet radio station. Uses [icecast2](http://icecast.org/) as streaming server and [liquidsoap](http://liquidsoap.fm/) as stream generator.
The `docker-compose` file will create a container for each service and the `radio.liq` is being used as entry point for `liquidsoap`.
