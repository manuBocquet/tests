FROM alpine:latest

# Install packages
RUN apk add python3 py3-pip bash
RUN apk add --no-cache --virtual .build-deps gcc libc-dev make python3-dev \
    && pip3 install --no-cache-dir uvicorn \
    && apk del .build-deps
RUN pip3 install --upgrade pip typing FastAPI
RUN apk add git curl

RUN mkdir /opt/bin

COPY init.sh /opt/bin
RUN chmod 700 /opt/bin/init.sh

EXPOSE 80
VOLUME ["/opt/app"]

CMD /opt/bin/init.sh
