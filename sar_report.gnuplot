unset output
set terminal dumb
set output "output.ascii"
set term dumb size 200, 120
set origin 0,0
set multiplot
set size 1,0.4
set origin 0,0.6
set timefmt "%H:%M"
set xdata time
set format x "%H:%M"
set yrange [0:100]
plot 'input' using 1:($2+$3+$4) with filledcurve x1 lc rgb "grey" title 'cpu usage %', '' using 1:2 with lines title 'Cpu usage %userland', '' using 1:3 with lines title 'Cpu usage %sys', '' using 1:4 with lines title 'Cpu usage %I/O wait', '' using 1:6 with linespoints pt 1 title 'Memory %used', '' using 1:7 with linespoints pt 2 title 'Mem %buffers+disk cache', '' using 1:8 with linespoints pt 3 title 'Swap %used'
 
set yrange [0:*]
set size 1,0.20
set origin 0,0.40
plot 'input' using 1:11 with lines title 'Run-q size', '' using 1:12 with lines title 'Load Avg-5', '' using 1:14 with lines title 'Proc created/sec'
 
set yrange [0:*]
set size 1,0.20
set origin 0,0.20
plot 'input' using 1:9 with lines title 'Pages swapin/s', '' using 1:10 with lines title 'Pages swapout/s'
 
set yrange [0:*]
set size 1,0.20
set origin 0,0
plot 'input' using 1:16 with lines title 'tps', '' using 1:17 with lines title 'rtps', '' using 1:18 with lines title 'wtps'
unset multiplot
unset output
reset
