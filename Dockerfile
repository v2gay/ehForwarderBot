FROM python:alpine3.6

WORKDIR /usr/src/app

ENV LANG C.UTF-8

RUN apk add --update --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .run-deps \
                ffmpeg \
                libmagic \
                python3 \
                py3-numpy \
                py3-pillow

COPY requirements.txt ./
COPY config.docker.py ./config.py
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./main.py" ]
