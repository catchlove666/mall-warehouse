#!/bin/bash
case $1 in
"start"){
echo ==========启动Hadoop==========
ssh okmi01 "source /etc/profile;start-dfs.sh" && ssh okmi02 "source  /etc/profile;start-yarn.sh" 
#&& ssh okmi03 "source  /etc/profile;mr-jobhistory-daemon.sh start historyserver"
};;
"stop"){
echo ==========停止Hadoop==========
ssh okmi01 "source /etc/profile;stop-dfs.sh" && ssh okmi02 "source  /etc/profile;stop-yarn.sh" 
#&& ssh okmi03 "source  /etc/profile;mr-jobhistory-daemon.sh stop historyserver"
};;
esac
