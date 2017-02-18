FROM daocloud.io/library/python:2.7.12
MAINTAINER peterz3g <peterz3g@163.com>

RUN mkdir -p /code
WORKDIR /code

COPY . /code/
ADD cron_jobs.txt /var/spool/cron/crontabs/root

RUN apt-get update && \
apt-get install -y cron && \
apt-get install -y default-jre && \
apt-get install -y vim && \
touch /code/jobs.log && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
chmod +x /code/entrypoint.sh && \
chmod +x /code/cron_jobs.sh && \
chmod 0600 /var/spool/cron/crontabs/root && \
pip install --upgrade pip && \
pip install -r /code/requirements.txt && \
ls

EXPOSE 80
ENTRYPOINT ["/bin/bash", "/code/entrypoint.sh"]
