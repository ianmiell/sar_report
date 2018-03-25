FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y gnuplot vim sysstat locales
RUN locale-gen en_US.UTF-8
ADD . /
WORKDIR /
ENTRYPOINT /sar_report.sh
