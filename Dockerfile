FROM gcr.io/spark-operator/spark:v2.4.5

LABEL Description="Spark commit customized image" \
      Version="2.4.5"

ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.3.0/hadoop-common-3.3.0.jar /opt/spark/jars/
