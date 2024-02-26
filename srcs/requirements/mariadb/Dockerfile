FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y
COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script1.sh /

RUN chmod +x script1.sh

CMD [ "./script1.sh"];
# CMD [ "sleep", "infinity"];
