# spark/Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/python:3.9-buster

# Install dependencies for adding custom repositories
RUN apt-get update && \
    apt-get install -y software-properties-common curl && \
    apt-get clean

# Download and install AdoptOpenJDK 8 (Temurin)
RUN mkdir -p /usr/share/man/man1 && \
    curl -fSL https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u302-b08/OpenJDK8U-jdk_x64_linux_hotspot_8u302b08.tar.gz \
    | tar -xz -C /usr/local && \
    mv /usr/local/jdk8u302-b08 /usr/local/java8 && \
    ln -s /usr/local/java8/bin/java /usr/bin/java

# Set environment variables for Java
ENV JAVA_HOME=/usr/local/java8
ENV PATH=$JAVA_HOME/bin:$PATH

# Install Spark
# Set Spark version and Hadoop version
# Define Spark and Hadoop versions
# Define Spark and Hadoop versions
ENV SPARK_VERSION=3.3.1
ENV HADOOP_VERSION=3

# Install Spark with specified Hadoop version
RUN curl -fSL https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    | tar -xz -C /usr/local && \
    mv /usr/local/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /usr/local/spark

# Upgrade pip and install required Python packages
# Upgrade pip
RUN pip install --upgrade pip

# Install pandas and numpy dependencies first
RUN pip install pandas==1.3.* numpy==1.21.*

# Install databricks-connect, removing pyspark first due to conflicts
RUN pip uninstall -y pyspark && \
    pip install databricks-connect==10.4.48

# Finally, reinstall pyspark to the required version
RUN pip install pyspark==3.3.1
   
# Set environment variables for Spark
ENV SPARK_HOME=/usr/local/spark
ENV PATH=$SPARK_HOME/bin:$PATH

# Copy the start-spark.sh and start-worker.sh scripts
COPY start-spark.sh /usr/local/spark/start-spark.sh
COPY start-worker.sh /usr/local/spark/start-worker.sh
RUN chmod +x /usr/local/spark/start-spark.sh /usr/local/spark/start-worker.sh

# Expose ports for Spark
EXPOSE 8080 7077 4040 8081
