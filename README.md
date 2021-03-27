# 电商数仓
## 项目简介
基于hadoop生态搭建的电商数仓
### 系统架构
![系统数据流程图.jpeg](https://github.com/okmii/mall-warehouse/blob/main/img/framework.png)

### 数仓分层
![系统数据流程图.jpeg](https://github.com/okmii/mall-warehouse/blob/main/img/layered.png)

### er图
![系统数据流程图.jpeg](https://github.com/okmii/mall-warehouse/blob/main/img/er.png)

### 数仓模型图
![系统数据流程图.jpeg](https://github.com/okmii/mall-warehouse/blob/main/img/dimension.png)

### 技术选型

| 名称 | 版本号 | 类型 | 说明 |
| :--- | :--- | :--- | :--- |
| hadoop | 2.7.2 | 数据存储 |  |
| spark | 2.0.0 | 计算引擎 | 使用spark作为hive的计算引擎 |
| hive | 3.4.6 | 数据计算 |  |
| flume | 1.7.0 | 数据采集传输 |  |
| kafka | 2.11-0.11 | 数据采集传输 |  |
| sqoop| 1.4.6 | 数据采集传输 |  |
| mysql| 5.7.30 | 数据存储 |  |
| azkaban| 3.84.4 | 任务调度 |  |
| zookeeper|3.4.10 | 集群管理 ||
| setuptools| 0.0.0 | 数据可视化 | imply方式安装 |
| jdk | 1.8.0 | 依赖 |  |

### 集群规划
![系统数据流程图.jpeg](https://github.com/okmii/mall-warehouse/blob/main/img/clusterplan.png)

### 项目结构说明
```
├─azkaban azkaban job文件 
│
├─shell 脚本
│  ├─ads.sh ads层加载数据脚本
│  │      
│  ├─*to*  从某个地方导入到某个地方如（mysql_to_hdfs.sh）就是从mysql导入到hdfs上
│  │     
│  ├─tools 集群启动停止脚本
│  │      
│  └─utils 工具脚本
│
├─table hive中数仓建表sql             
│      
└──jar 
   ├─hive  hive自定义函数所需要的jar包
   │      
   ├─flume flume拦截器所需要的jar包
   │     
   ├─log   日志生成脚本
   │      
   └─db    数据库数据生成脚本
```
          
### 脚本说明

<table>
  <tr>
    <th>名称</th>
    <th>参数</th>
    <th>参数说明</th>
    <th>脚本说明</th>
  </tr>


  <tr>
    <td rowspan="2">mysql_to_hdfs.sh</td>
    <td>$1</td>
    <td>可选：first(首次导入，特殊表处理)、all（全部导入）</td>
    <td rowspan="2">从mysql中导入数据到hdfs</td>
  </tr>
  <tr>
    <td>$2</td>
    <td>时间</td>
  </tr>
  
   <tr>
    <td>hdfs_to_ods_log.sh</td>
    <td>$1</td>
    <td>分区名（时间）</td>
    <td>数仓ods层自动导入数据（埋点数据数据）</td>
  </tr>
  
  <tr>
    <td rowspan="2">hdfs_to_ods_db.sh</td>
    <td>$1</td>
    <td>可选：first(首次导入，特殊表处理)、all（全部导入）</td>
    <td rowspan="2">数仓ods层自动导入数据（业务数据）</td>
  </tr>
  <tr>
    <td>$2</td>
    <td>时间</td>
  </tr>
   
  <tr>
    <td>ods_to_dwd_log.sh</td>
    <td>$1</td>
    <td>分区名（时间）</td>
    <td>数仓dwd层自动导入数据（埋点数据）/td>
  </tr>
  
  
 <tr>
    <td rowspan="2">ods_to_dwd_db.sh</td>
    <td>$1</td>
    <td>可选：first(首次导入，特殊表处理)、all（全部导入）</td>
    <td rowspan="2">数仓dwd层自动导入数据（业务数据）</td>
  </tr>
  <tr>
    <td>$2</td>
    <td>时间</td>
  </tr>

  
   <tr>
    <td>dwd_to_dws.sh</td>
    <td>$1</td>
    <td>分区名（时间）</td>
    <td>数仓dws层自动导入数据</td>
  </tr>
  
   <tr>
    <td>dws_to_dwt.sh.sh</td>
    <td>$1</td>
    <td>分区名（时间）</td>
    <td>数仓dwt层自动导入数据</td>
  </tr>
  
  <tr>
    <td>ads.sh</td>
    <td>$1</td>
    <td>分区名（时间）</td>
    <td>数仓ads层数据导入脚本</td>
  </tr>
  
  
   <tr>
    <td>hdfs_to_mysql.sh</td>
    <td>$1</td>
    <td>hive导出指定hive表数据，可选：ads_user_topic(用户主题)、ads_area_topic（地区主题）、all（上述二个全部导出）</td>
    <td>hive导出ads层数据至mysql脚本</td>
  </tr>
  <tr>
    <td>f1.sh</td>
    <td>$1</td>
    <td>可选：start（启动）、stop（停止）</td>
    <td>群起采集flume脚本</td>
  </tr>
           <tr>
    <td>f2.sh</td>
    <td>$1</td>
    <td>可选：start（启动）、stop（停止）</td>
    <td>启动消费flume脚本</td>
  </tr>
  <tr>
    <td>kafka.sh</td>
    <td>$1</td>
    <td>可选：start（启动）、stop（停止）</td>
    <td>启动/停止Kafka集群</td>
  </tr>
  <tr>
    <td>hd.sh</td>
    <td>$1</td>
    <td>可选：start（启动）、stop（停止）</td>
    <td>启动/停止hadoop集群</td>
  </tr>
    <tr>
    <td>zk.sh</td>
    <td>$1</td>
    <td>可选：start（启动）、stop（停止）</td>
    <td>启动/停止zk集群</td>
  </tr>
   <tr>
    <td>xcall.sh</td>
    <td>$1</td>
    <td>要执行的命令</td>
    <td>集群执行统一命令脚本</td>
  </tr>
   <tr>
    <td>xsync.sh</td>
    <td>$1</td>
    <td>文件绝对路径</td>
    <td>集群分发文件脚本</td>
  </tr>
  
</table>

### 集群规划
![系统数据流程图.jpeg](https://github.com/okmii/mall-warehouse/blob/main/img/clusterplan.png)