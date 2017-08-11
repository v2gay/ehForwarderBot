FROM python:3.6

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    ffmpeg

COPY requirements.txt ./
COPY config.docker.py ./config.py
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./main.py" ]
