FROM debian:bullseye

RUN apt update -y && apt install nginx -y 
RUN apt install vim -y
RUN apt install curl -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/cert_key.key -subj "/C=MO/ST=KH/L=Khouribga/O=1337/OU=1337/CN=idryab.1337.ma/UID=idryab"
COPY ./conf/default /etc/nginx/sites-available/default

RUN chmod 755 /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]