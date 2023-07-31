# todo: add ARGS

FROM python:3.9 as app

RUN mkdir /app
WORKDIR /app
RUN pip install --no-cache-dir \
	django \
	django-environ
	
COPY app /app

CMD ["python", "manage.py", "runserver"]

# todo: записать в healthcheck telnet localhost 8000
# дописать порты
