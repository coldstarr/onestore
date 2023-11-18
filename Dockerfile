FROM python:3.10
WORKDIR /app

ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt-get update

# install dependencies
RUN pip install --upgrade pip
COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY . /app/

ENTRYPOINT ["gunicorn", "backend.wsgi"]