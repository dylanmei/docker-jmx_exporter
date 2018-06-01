FROM openjdk:8-jre-alpine

ARG version=0.3.1

ENV JAVA_OPTS ""
ENV JMX_OPTS  "-Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_httpserver/${version}/jmx_prometheus_httpserver-${version}-jar-with-dependencies.jar /opt/prometheus/jmx_exporter.jar

EXPOSE 9209
ENTRYPOINT ["/docker-entrypoint.sh"]
