FROM alpine:3.14.1

RUN apk add -U texlive python3 py3-pip && \
    pip3 install awscli pygments && \
    rm -rf /var/cache/apk/


