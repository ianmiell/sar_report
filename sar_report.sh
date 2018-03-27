#!/bin/bash

# See this article for context:
# See also: sar_report.awk, 
# http://aionica.computerlink.ro/2011/02/visualize-sar-reports-with-awk-and-gnuplot/

set -eu
DAY=$(date +%d)
rm -f sarout
touch sarout
for i in -u -r -q -w -W -b
do
	LC_TIME="en_US.UTF-8" sar -f /var/log/sysstat/sa${DAY} $i | tail -n +4 | head -n -1 >> sarout
	echo "===========" >> sarout
done
cat sarout | awk -f sar_report.awk > /tmp/input
cat /tmp/input
gnuplot sar_report.gnuplot
cat /tmp/output.ascii
rm -f sarout
