FROM alpine:latest

LABEL maintainer.first="Nicolai Reuschling 'nicolai.reuschling@dkd.de'"

RUN mkdir /arc && mkdir /arc/libphutil && mkdir /arc/arcanist
COPY ./libphutil/ /arc/libphutil/
COPY ./arcanist/ /arc/arcanist/

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
