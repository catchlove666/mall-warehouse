#!/bin/bash
 
 for((i=1 ;i <=3 ;i=$i+1 ));do
	echo ==========okmi0$i $@==========
	ssh okmi0$i "source /etc/profile;$@"
 done

