#!/bin/bash

# Start the Spark master with the configured host and ports
$SPARK_HOME/sbin/start-master.sh -h 0.0.0.0 --port 7077 --webui-port 8080

# Keep the container running by tailing the Spark master log
tail -f $SPARK_HOME/logs/spark--org.apache.spark.deploy.master.Master-1-*.out
