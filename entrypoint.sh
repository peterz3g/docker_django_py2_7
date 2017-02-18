#!/bin/bash
today=`date +"%Y%m%d"`

printenv | sed 's/^\(.*\)$/export \1/g' | grep 'MYSQL_' > /code/project_env.sh
cat /code/project_env.sh
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
service cron restart

python /code/demo/manage.py runserver 0.0.0.0:8000
