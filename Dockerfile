FROM nginx:latest

LABEL maintainer="teamdevops@gmail.com"

WORKDIR /usr/share/nginx/html

COPY ./miWeb .

EXPOSE 80