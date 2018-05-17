#!/bin/bash

$HADOOP_HOME/hadoop-services.sh

echo "Start spark logs server"
hdfs dfs -mkdir /spark-logs
${SPARK_HOME}/sbin/start-history-server.sh
