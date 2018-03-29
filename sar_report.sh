#!/bin/bash

# See this article for context:
# See also: sar_report.awk, 
# http://aionica.computerlink.ro/2011/02/visualize-sar-reports-with-awk-and-gnuplot/

set -eu

SAR_REPORT_DAY=${SAR_REPORT_DAY:-$(date +%d)}
LINES=${LINES:-$(stty size | awk '{print $1}')}
COLUMNS=${COLUMNS:-$(stty size | awk '{print $NF}')}
TERM=${TERM:-xterm}

rm -f sarout
if [[ ${SAR_REPORT_DEBUG:-''} != '' ]]
then
	env
	set -x
fi

echo "SAR REPORT GRAPHS FOR DAY: ${SAR_REPORT_DAY}"

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
