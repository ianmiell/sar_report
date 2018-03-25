FROM debian
RUN apt-get update -y && apt-get install gnuplot
ADD . /
