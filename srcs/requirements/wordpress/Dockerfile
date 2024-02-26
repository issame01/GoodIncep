FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get install wget -y
RUN apt-get install curl -y
RUN mkdir -p /var/www/wordpress
RUN apt-get install -y php php-fpm php-mysql mariadb-client


RUN chown -R root:root /var/www/wordpress


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/script1.sh /
RUN chmod +x script1.sh

# ENTRYPOINT [ "./script1.sh" ];

CMD [ "./script1.sh" ];
# CMD [ "sleep", "infinity"];