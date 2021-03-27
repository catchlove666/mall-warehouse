#! /bin/bash

case $1 in
"start"){
        for i in okmi02 okmi03
        do
                echo " --------启动 $i 采集flume-------"
                ssh $i "source /etc/profile;nohup /opt/module/flume-1.7.0/bin/flume-ng agent --conf-file /opt/module/flume-1.7.0/job/file-flume-kafka.conf --name a1 -Dflume.root.logger=INFO,LOGFILE >/opt/module/flume-1.7.0/log1.txt 2>&1  &"
        done
};;	
"stop"){
        for i in okmi02 okmi03
        do
                echo " --------停止 $i 采集flume-------"
                ssh $i "source /etc/profile;ps -ef | grep file-flume-kafka | grep -v grep |awk  '{print \$2}' | xargs -n1 kill -9 "
        done

};;
esac

 
