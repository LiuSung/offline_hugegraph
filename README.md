# offline_hugegraph

本项目名称为：电商——离线图数仓，涉及到技术分别为：zookeeper、Hadoop、Hive、Spark、HBase、Azkaban、flume、Sqoop、Presto、Hugegraph。

## 集群角色规划

服务器内存：xuanbishe01：16G、xuanbishe02:8G、xuanbishe03:8G（最少为8、4、4）

|                            | xuanbishe01 | xuanbishe02 | xuanbishe02 |
| -------------------------- | ----------- | ----------- | ----------- |
| zookeeper                  | √           | √           | √           |
| namenode                   | √           |             |             |
| datanode                   | √           | √           | √           |
| SecondaryNameNode          | √           |             |             |
| ResourceManager            | √           |             |             |
| nodemanager                | √           | √           | √           |
| kafka                      | √           | √           | √           |
| flume                      | √           | √           | √           |
| HiveServer2                | √           |             |             |
| MySql                      | √           |             |             |
| HMaster                    | √(active)   | √(standby)  |             |
| HRegionServer              | √           | √           | √           |
| Hugegraph                  | √           |             |             |
| Hugegraph-Hubble(图可视化) |             |             | √           |

## 数据处理流程

![image-20221010151501096](https://fastly.jsdelivr.net/gh/LiuSung/resimages@master/img/202210101515166.png)

## 项目目录介绍

### digital_sql

![image-20221009160850666](https://fastly.jsdelivr.net/gh/LiuSung/resimages@master/img/202210091608708.png)

![image-20221009160911610](https://fastly.jsdelivr.net/gh/LiuSung/resimages@master/img/202210091609646.png)

介绍数据仓库具体分层，以及每层的建表语句，每层的作用；shell目录下是每层中数据的装在脚本，每层建表思路，处理方式，见digital_sql下的README.md

### huge_code

src/main/java/com/admirefx/flume/Interceptor：埋点数据从日志采集到hdfs时自定义的flume拦截器

src/main/java/com/admirefx/hive/udtf：使用hivesql进行数据处理时自定义的udt函数

src/main/java/com/admirefx/hugegraph：hugegraph图谱模型schema设计，具体介绍见huge_code下的README.md



