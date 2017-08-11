FROM python:alpine3.6

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY config.docker.py ./config.py
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./main.py" ]
