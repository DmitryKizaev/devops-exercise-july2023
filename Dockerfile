# todo: add ARGS

FROM ubuntu:22.04 as app
WORKDIR /

RUN apt update && apt install -qq -y \
    python3 \
    python3-venv

RUN mkdir hello_django \
    && cd hello_django \
    && python3 -m venv venv \
    && . venv/bin/activate \
    && pip install django \
    && django-admin startproject mysite . \
    && python manage.py startapp hello
    # todo: зафиксировать версию django через переменную

COPY django-configs/urls-template.py mysite/urls.py
COPY django-configs/views-template.py hello/views.py

CMD ["python", "manage.py", "runserver"]

# todo: записать в healthcheck
# telnet localhost 8000
