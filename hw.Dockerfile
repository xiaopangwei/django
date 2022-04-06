# 指定基础镜像
FROM python:3.6.12

# 创建者信息
MAINTAINER HW

# 安装django
RUN pip3 install django==2.2.2 -i https://pypi.douban.com/simple/
# 下载skywalking
RUN wget http://console.service.163.org/download/napm/apache_skywalking-0.4.0-py3-none-any.whl
# 安装skywalking
RUN python3 -m  pip install apache_skywalking-0.4.0-py3-none-any.whl
RUN django-admin startproject app
#修改配置文件
COPY ./settings.py /app/app/settings.py
COPY ./wsgi.py     /app/app/wsgi.py
RUN cd /app && django-admin startapp docker

# 启动
CMD cd /app && python3 manage.py runserver 0.0.0.0:8000
