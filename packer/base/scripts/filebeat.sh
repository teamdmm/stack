#!/bin/bash
set -e

systemctl start filebeat.service
systemctl enable filebeat.service
