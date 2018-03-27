## Run

Run with:

```
docker run \
        -e SAR_REPORT_DAY="${SAR_REPORT_DAY:-$(date +%d)}" \
        -e LINES=${LINES:-$(stty size | awk '{print $1}')} \
        -e COLUMNS=${COLUMNS:-$(stty size | awk '{print $NF}')} \
        -e TERM=${TERM:-xterm} \
        -v /var/log/sysstat:/var/log/sysstat:ro \
        imiell/sar_report
```

Or just run:

```
./sar_report
```

within this repo.

To run for a particular day, set the `SAR_REPORT_DAY` variable, eg to `01` for
the first of the month. The default is to run for today.


## Outputs

Output auto-scales to your terminal size.

Example output:

```
  100 +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
      |               +               +               +               +               +               +               +               +       XX      +               +               +               |
      |                                                                                              #                XXX  #                  XX           XX          XX         cpu usage % ******* |
   80 |-+                                                                   XX $                     XX  XX  $        X$X  XX                 X$      XX  X$X         XXX$Cpu usage %userland #######-|
      |                                                                     XX$$         #           $XX XX$ $        X$$X$$X# # $ $$$X$$$XX  $$      $X  X$$         X$X$     Cpu usage %sys $$$$$$$ |
      |                                                                     X$$$$XX      XX          $$$ $X$$$$$$X$   $$$$$$$$$$X$X$$$$$$$$$  $$X XX  $X  X$$$XXX     X$$$Cpu usage %I/O wait %%%%%%% |
      |                                                                     $$$$$$X$XXX X$X XXX XXX X$$$ $$$$$$$$$$$  $$$$$$$$$$$$$$$$$$$$$$  $$X$$X $$$ $$$$$$$X$$   $$$$       Memory %used @@@A@@@ |
   60 |-+                                                                   $$$CCCCCCCCCCCCCCCCCCCCCCCCCX$$CCCCCCCCC $$CCCCCCCCCCCCCCCCCCCCCC $CCCCC $CC $$CCCCCCCC   MCCC%buffers+disk cache#&&&B&&&$|
      |CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC$CCC$$$$$$$$$$$$$$$$$$$$$$$=XCC$$$$$$$$= CC$$$$$$$$$$$$$$$$$$$$$= CC$$$=CCC= CC$$$$$$$=   CC$C   $X$$$XSwap %used$===C===$|
      |XXXXXXXXXXXXXXXXXXXXXXXXXXXX                                        =CC$$$$$$$$$$$$$$$$$$$$$$$$$=CC$$$$$$$$$=CC$$$$$$$$$$$$$$$$$$$$$$=CC$$$$=C$$=CC$$$$$$$$=  CC$$= $ $X$$$X$$$X$$$X$$$X$$$X$$$|
   40 |=============================================================================================================================================C===C==================CCCCCCCCCCCCCCCCCCCCCCCCCCC|
      |$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                        =CX$$$$$$$$$$$X$$$$$$$$$$$XX=C$$$$$$$$$$$C$$$$$XX$$$$$$$$$$$$$$$$=C$$$$$=C$$=C$$$$$$$$$=XXC$$$=C$ $$$$$$$$$$$$$$$$$$$$$$$$$|
      |$$$X$$$X$$$X$$$$$$$$$$$X$$$$                                        =CX$$$$$$$$$$$X$$$$$$$$$$$XX=C$$$$$$$$$$$C$$$$$XXX$$$$$$$$$$$$$$$=C$$$$$C$$$=C$$$$$$$$$=XXC$$$CC$ $$$$$$$$$$$$$$$$$$$$$$$$$|
      |$$$X$$$X$$$X$$$$$$$$$$$X$$$$                                        C$X$$$$$$$$$$$X$$$$$$$$$$$##=C$$$$$$$$$$$C$$$$$XXX$$$$$$$$$$$$$$$C$$$$$$C$$$C$$$$$$$$$$=$$C$$$=C$$$$$$$$$$$$$$$$$$$$$$$$$$$|
   20 |$$$#$$$#$$$#$#$$$$$$$$$#$$$$                                        C##$$$$$$$$$$$#$$$$$$$$$$$##C$$$#$$$$$$$$C$$$$$###$$$$$$$$$$$$$$$C$$$$$$C$$$C$#$$$$$$$$CCCC#$$C$$$$$$$$$$$$$$$$$$$$$$$$$$$$|
      |$##X###X#$$X$#$$$#$$$$$X$$$$                                        $#X$$$$$$$$$$$X$$$$$$$$$$$XX##$$#$#$$$$$$$#$$#$X##$$$$$$$$$$$$$$$$#$$$$$$#$$$##$$#$$$$$$$$$#$#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$|
      |BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB%$$$$$$$$$$$$$$$$$$$$$$$%$$$$$$%$$$%$$$$$$$$$$$$$%$$$$%$$$$$$$$$$$$$$$$$$$$$$$$$$$|
    0 +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    00:00           02:00           04:00           06:00           08:00           10:00           12:00           14:00           16:00           18:00           20:00           22:00           00:00

  16 +------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  14 |-+*            +               +               +               +         *     +                *  **  *        *    *   *      +  *            **    **        +               +             +-|
  12 |-+*                                                                    * *     *          *     *  ** ** *      **** *   * *    *  *    *       **    **         * *         Run-q size *******-|
  10 |-+*           *  *                                                    ** *** * *   *    * *    **  ******* *    ****** *** *    * ***   * *     ** *****   *     ***         Load Avg-5 #######-|
   8 |-+* **  **   **  *  **                                                ** *** ***  **  *** *******  ******* ***  ********** ****** *** * ******  ** ******* *    **** * Proc created/sec $$$$$$$-|
   6 |*************************************************************************#*****************************#********###*##******************#***********#*#************#****************************|
   4 |************ ***** ***** **  * * *  **   *       * * *         ***   *#####*##****###*********####**#######*##**##########*###########**######**##*######*##  **#####** *************** ********|
   2 |################################################################################################################################################################################################|
   0 +------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   00:00           02:00           04:00           06:00           08:00           10:00            12:00           14:00           16:00           18:00           20:00           22:00           00:00

    1 +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  0.8 |-+             +               +               +               +               +               +               +               +               +               +               +             +-|
      |                                                                                                                                                                        Pages swapin/s ******* |
  0.6 |-+                                                                                                                                                                     Pages swapout/s #######-|
  0.4 |-+                                                                                                                                                                                           +-|
      |                                                                                                                                                                                               |
  0.2 |-+             +               +               +               +               +               +               +               +               +               +               +             +-|
    0 +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    00:00           02:00           04:00           06:00           08:00           10:00           12:00           14:00           16:00           18:00           20:00           22:00           00:00

    1 +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  0.8 |-+             +               +               +               +               +               +               +               +               +               +               +             +-|
      |                                                                                                                                                                                   tps ******* |
  0.6 |-+                                                                                                                                                                                rtps #######-|
  0.4 |-+                                                                                                                                                                                wtps $$$$$$$-|
      |                                                                                                                                                                                               |
  0.2 |-+             +               +               +               +               +               +               +               +               +               +               +             +-|
    0 +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    00:00           02:00           04:00           06:00           08:00           10:00           12:00           14:00           16:00           18:00           20:00           22:00           00:00
```


## Troubleshooting

If the folder with sa files is elsewhere.
or replace the `var/log/sysstat` with the appropriate folder.
