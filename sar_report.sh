#!/bin/bash

# See this article for context:
# See also: sar_report.awk, 
# http://aionica.computerlink.ro/2011/02/visualize-sar-reports-with-awk-and-gnuplot/

set -eu

echo "SAR REPORT GRAPHS FOR DAY: ${SAR_REPORT_DAY}"
if [[ ${SAR_REPORT_DEBUG:-''} != '' ]]
then
	set -x
fi

rm -f sarout
touch sarout
for i in -u -r -q -w -W -b
do
	LC_TIME="en_US.UTF-8" sar -f /var/log/sysstat/sa${SAR_REPORT_DAY} $i | tail -n +4 | head -n -1 >> sarout
	echo "===========" >> sarout
done
cat sarout | awk -f sar_report.awk > /tmp/input
gnuplot -e "cols=${COLUMNS}; rows=${LINES}" sar_report.gnuplot
cat /tmp/output.ascii
rm -f sarout
