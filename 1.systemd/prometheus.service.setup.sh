#!/bin/bash

SERVICE_NAME=prometheus

cp $SERVICE_NAME.service /etc/systemd/system/
chmod 644 /etc/systemd/system/$SERVICE_NAME.service

cd /tmp
wget https://github.com/prometheus/prometheus/releases/download/v2.51.2/prometheus-2.51.2.linux-amd64.tar.gz
tar -xzvf prometheus-2.51.2.linux-amd64.tar.gz
mv prometheus-2.51.2.linux-amd64 /opt/$SERVICE_NAME
id -u $SERVICENAME &>/dev/null || useradd -M -U $SERVICE_NAME
chown -R $SERVICE_NAME:$SERVICE_NAME /opt/$SERVICE_NAME

systemctl daemon-reload
systemctl enable $SERVICE_NAME.service
systemctl start $SERVICE_NAME.service
systemctl status $SERVICE_NAME.service
