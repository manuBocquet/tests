FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps gcc libc-dev make python3 py3-pip python3-dev \
    && pip3 install --no-cache-dir uvicorn FastAPI \
    && apk del .build-deps gcc libc-dev make
RUN mkdir /opt/bin
COPY src/* /opt/bin
RUN chmod 700 /opt/bin/start.sh

EXPOSE 80
VOLUME ["/opt/app"]

CMD /opt/bin/start.sh
