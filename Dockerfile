FROM alpine:latest

RUN apk add --no-cache python3
RUN mkdir /opt/bin
COPY src/start.sh /opt/bin/start.sh
RUN chmod 700 /opt/bin/start.sh
CMD /opt/bin/start.sh
