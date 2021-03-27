#! /bin/bash

case $1 in
"start"){
    for i in okmi01 okmi02 okmi03 
    do
        echo " --------启动 $i Kafka-------"
        ssh $i "source /etc/profile;/opt/module/kafka_2.11-0.11.0.2/bin/kafka-server-start.sh -daemon /opt/module/kafka_2.11-0.11.0.2/config/server.properties"
    done
};;
"stop"){
    for i in okmi01 okmi02 okmi03 
    do
        echo " --------停止 $i Kafka-------"
        ssh $i "source /etc/profile;/opt/module/kafka_2.11-0.11.0.2/bin/kafka-server-stop.sh stop"
    done
};;
esac

 
