FROM mcr.microsoft.com/vscode/devcontainers/base:alpine-3.16
# FROM ubuntu:20.04

RUN apk update && apk add libstdc++ libgcc bash openjdk8 curl tar

# Install Java
# RUN apt-get update && \
#     apt-get install -y openjdk-8-jdk && \
#     apt-get clean;
# RUN apk add --no-cache bash openjdk8 curl tar bash

# Set environment variables for Hadoop and Java
ENV HADOOP_VERSION 3.3.2
ENV HADOOP_HOME /usr/local/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$HADOOP_HOME/bin:$JAVA_HOME/bin
# Set JAVA_HOME
# ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
# ENV PATH $JAVA_HOME/bin:$PATH

# RUN apk --no-cache add ca-certificates wget && \
#     wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
#     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk && \
#     apk add glibc-2.31-r0.apk && \
#     rm glibc-2.31-r0.apk

# Download and install Hadoop
RUN curl -L https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz | tar -xz -C /usr/local/ \
    && mv /usr/local/hadoop-$HADOOP_VERSION $HADOOP_HOME \
    && mkdir -p $HADOOP_HOME/logs

# Copy Hadoop configuration files
COPY core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml

# Expose HDFS web UI and namenode ports
EXPOSE 9870 9000

# Start the NameNode directly and redirect logs to console
CMD ["sh", "-c", "if [ ! -d /usr/local/hadoop/dfs/name/current ]; then $HADOOP_HOME/bin/hdfs namenode -format; fi && $HADOOP_HOME/bin/hdfs namenode"]
