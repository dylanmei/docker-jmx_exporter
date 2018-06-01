#!/bin/sh

EXPORTER_PORT="${1:-9209}"

if [ -z "${EXPORTER_CONF}" ]; then
  EXPORTER_CONF=/etc/prometheus/jmx_exporter.yml

  mkdir -p /etc/prometheus
  cat <<EOF > "${EXPORTER_CONF}"
---
# https://github.com/prometheus/jmx_exporter#configuration
#
hostPort: localhost:9010
username: 
password: 

rules:
- pattern: ".*"
EOF
fi

java $JAVA_OPTS $JMX_OPTS -jar /opt/prometheus/jmx_exporter.jar ${EXPORTER_PORT} ${EXPORTER_CONF}
