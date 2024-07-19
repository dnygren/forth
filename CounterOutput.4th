\ Floating point print formatted usage: total width printf
: printf 4 4 f.rdp ; \ digits after decimal and significant digits set to 4

\ Print counter outputs from a 32.768 kHz input clock
: CounterOutput
cr
32.768e03                         \ 32.768 kHz input clock
fdup fe. ."  Clock Input" cr \ Print input clock
0                                 \ Start counting at bit 0
begin dup 34 <=                   \ While bit <= 34
while
dup 9 <= if ."  " endif           \ Print an extra space in the output if <= 9
dup . ." Bit "                                            \ Print bit
2.0e f/ fdup 7 printf ."  Hz "                             \ Print cycles / sec
\ The word "1/f" is the same as "1.0e fswap f/"
fdup 1/f 7 printf ."  Sec "                               \ Print seconds
fdup 1/f 60.0e f/ 7 printf ."  Min "                      \ Print minutes
fdup 1/f 60.0e f/ 60.0e f/ 7 printf ."  Hour "            \ Print hours
fdup 1/f 60.0e f/ 60.0e f/ 24.0e f/ 7 printf ."  Day " cr \ Print days
1+
repeat
drop
fdrop
;
