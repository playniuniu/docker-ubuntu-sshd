#!/bin/sh

# change sshd_config
if [ -f "/etc/ssh/sshd_config" ]; then
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/^PasswordAuthentication\s+.*/PasswordAuthentication no/' /etc/ssh/sshd_config
fi

# prepare run dir
if [ ! -d "/var/run/sshd" ]; then
    mkdir -p /var/run/sshd
fi

# prepare root ssh folder
if [ ! -d "/root/.ssh/" ]; then
    mkdir -p /root/.ssh/ && chmod 700 /root/.ssh/
fi

# prepare authorized_keys
if [ -f "/data/ssh/id_rsa.pub" ]; then
    cp /data/ssh/id_rsa.pub /root/.ssh/authorized_keys
fi

exec "$@"
