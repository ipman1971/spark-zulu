FROM ipman1971/hadoop-zulu

MAINTAINER Ipman1971 <ipman1971@gmail.com>

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="spark-zulu" \
      org.label-schema.description="Spark with Yarn" \
      org.label-schema.vcs-url="https://github.com/ipman1971/spark-zulu" \
      org.label-schema.vendor="Ipman1971" \
      org.label-schema.version="1.0.0" \
      com.ipman1971.baseimage-contents='{"contents": [{"name": "spark", "version": "2.3.0"}]}'

ENV SPARK_VERSION 2.3.0
ENV SPARK_HOME /usr/local/spark
ENV PATH ${SPARK_HOME}/bin:${PATH}
ENV HADOOP_CONF_DIR ${HADOOP_HOME}/etc/hadoop
ENV LD_LIBRARY_PATH ${HADOOP_HOME}/lib/native

RUN set -x && \
    wget -O spark.tgz -q http://apache.rediris.es/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    tar -xzvf spark.tgz && \
    mv spark-${SPARK_VERSION}-bin-hadoop2.7 spark && \
    mv spark /usr/local/spark

ADD config/spark-defaults.conf ${SPARK_HOME}/conf/spark-defaults.conf
ADD scripts/start-spark.sh ${SPARK_HOME}/bin/start-spark.sh

RUN set -x && \
    chmod 744 ${SPARK_HOME}/bin/start-spark.sh

ENTRYPOINT ${SPARK_HOME}/bin/start-spark.sh; bash
