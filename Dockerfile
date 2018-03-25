FROM debian
RUN apt-get update -y && apt-get install -y gnuplot
ADD . /
