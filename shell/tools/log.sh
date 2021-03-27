#!/bin/bash
for i in okmi02 okmi03; do
    echo "========生成日志到$i ========"
    ssh $i "source /etc/profile;cd /opt/module/applog/; java -jar gmall2020-mock-log-2020-05-10.jar >/dev/null 2>&1 &"
done 
