FROM ghcr.io/gottaloveit/base:latest

LABEL org.opencontainers.image.source = "https://github.com/gottaloveit/feeder1090"
LABEL org.opencontainers.image.version=1.1.0

RUN wget https://www.flightaware.com/adsb/piaware/files/packages/pool/piaware/f/flightaware-apt-repository/flightaware-apt-repository_1.2_all.deb && \
    dpkg -i flightaware-apt-repository_1.2_all.deb && \
    apt update

RUN apt install -y dump1090-fa

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY run.sh /run.sh

RUN chmod +x /run.sh

EXPOSE 8080 30001 30002 30003 30004 30005 30104

ENTRYPOINT ["/run.sh"]