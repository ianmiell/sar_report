Run with:

```
docker run -e LINES=${LINES:-$(stty size | awk '{print $1}')} -e COLUMNS=${COLUMNS:-$(stty size | awk '{print $NF}')} -e TERM=${TERM:-xterm} -v /var/log/sysstat:/var/log/sysstat:ro imiell/sar_report
```

or replace the `var/log/sysstat` with the appropriate folder
