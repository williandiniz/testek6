version: '3.4'
networks:
  k6:
  grafana:
services:
  influxdb:
    image: influxdb:latest
    networks:
      - k6
      - grafana
    ports:
      - "8086:8086"
    environment:
      - INFLUXDB_DB=k6
grafana:
    image: grafana/grafana:latest
    networks:
      - grafana
    ports:
      - "3000:3000"
    environment:
      - GF_AUTH_ANONYMOUS_ORG_ROLE=Admin
      - GF_AUTH_ANONYMOUS_ENABLED=true
      - GF_AUTH_BASIC_ENABLED=false
    volumes:
      - ./dashboards:/var/lib/grafana/dashboards
      - ./grafana-dashboard.yaml:/etc/grafana/provisioning/dashboards/dashboard.yaml
      - ./grafana-datasource.yaml:/etc/grafana/provisioning/datasources/datasource.yaml
k6:
    image: loadimpact/k6:latest
    networks:
      - k6
    ports:
      - "6565:6565"
    environment:
      - K6_OUT=influxdb=http://influxdb:8086/k6
    volumes:
      - ./scripts:/scripts
