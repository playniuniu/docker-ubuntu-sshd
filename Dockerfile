FROM ubuntu:latest
MAINTAINER playniuniu <playniuniu@gmail.com>

VOLUME /data

RUN apt-get update \
    && apt-get install -y python openssh-server \
    && apt-get clean

COPY entrypoint.sh /usr/sbin

EXPOSE 22

ENTRYPOINT ["/usr/sbin/entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
