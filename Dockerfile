FROM alpine:3.11.3

RUN apk add -U texlive python3 && \
    pip3 install awscli pygments && \
    rm -rf /var/cache/apk/


