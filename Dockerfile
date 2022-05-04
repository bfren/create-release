FROM alpine

RUN apk add curl

COPY LICENSE README.md /
COPY entrypoint.sh /init

RUN chmod +x /init
ENTRYPOINT [ "/init" ]
