FROM nginx:alpine-perl

COPY ./iac/docker/nginx-conf/nginx.conf /etc/nginx/conf.d/
COPY ./iac/docker/cert/crt/mautic-test.crt /etc/ssl/certs/mautic-test.crt
COPY ./iac/docker/cert/key/mautic-test.key /etc/ssl/private/mautic-test.key