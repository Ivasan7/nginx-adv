#!/bin/bash

cp /etc/systemd/system/web-client{,2}.service
cp /etc/systemd/system/web-client{,3}.service

systemctl start web-client2
systemctl start web-client3
