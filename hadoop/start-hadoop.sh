#!/bin/bash

# Check if the NameNode data directory is empty
if [ ! -d "/data/hdfs/name/current" ]; then
  echo "Formatting NameNode..."
  hdfs namenode -format -force -nonInteractive
fi
# Format the HDFS Namenode - only needed the first time
$HADOOP_HOME/bin/hdfs namenode -format -force -nonInteractive

# Start HDFS and YARN services
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

# Keep the container running
tail -f /dev/null