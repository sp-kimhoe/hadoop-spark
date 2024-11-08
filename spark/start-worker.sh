#!/bin/bash

# Connect the worker to the Spark master specified by SPARK_MASTER_URL
$SPARK_HOME/sbin/start-worker.sh $SPARK_MASTER_URL

# Keep the container running by tailing the Spark worker log
tail -f $SPARK_HOME/logs/spark--org.apache.spark.deploy.worker.Worker-1-*.out
