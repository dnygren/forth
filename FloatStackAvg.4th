#! /usr/bin/gforth
\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\ FloatStackAvg.4th : Arithmetic average all values on the floating point stack
\
\ Created by: Daniel C. Nygren
\ Email: nygren@msss.com
\ Permanent Email: dan.nygren@gmail.com
\
\ Copyright (c) 2001, 2024, Daniel C. Nygren.
\
\ BSD 0-clause license, "Zero Clause BSD", SPDX: 0BSD
\
\ Permission to use, copy, modify, and/or distribute this software for any
\ purpose with or without fee is hereby granted.
\
\ THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
\ REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
\ AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
\ INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
\ LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
\ OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
\ PERFORMANCE OF THIS SOFTWARE.
\
\   Start here a paragraph explaining what the module does and how it works.
\ Include a description of module limitations and algorithms.
\
\ CALL SEQUENCE  fclearstack 2e3 3k FloatStackAvg
\
\ EXAMPLES       (Examples of calls)
\
\ TARGET SYSTEM  gforth
\
\ DEVELOPED ON   gforth
\
\ CALLS          See words used in code
\
\ CALLED BY      N/A
\
\ INPUTS         floating point stack values
\
\ OUTPUTS        average of floating point stack values left on fp stack
\
\ RETURNS        N/A
\
\ ERROR HANDLING (Describe how errors are handled)
\
\ SECURE CODING  (List methods used to prevent exploits against this code)
\
\ WARNINGS       1) This word will average all values on the floating point
\                stack. Clear any existing values from the floating point stack
\                with fclearstack if you don't want them averaged also.
\                (2. Describe anything a maintainer should be aware of)
\                (N. Describe anything a maintainer should be aware of)
\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\ (Delete this explanation from your code.)
\ The below lines are optionally used to aid maintainers by indicating at
\ which point portions of the code intended or likely to be modified end.

\ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
\ ^^^^^^^^^^ Place code that may need modification above this point. ^^^^^^^^^^
\ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

( Usage of FloatStackAvg)
false [IF] \ Begin block comment

\ Clear any existing values from the floating point stack
fclearstack

\ Place values on floating point stack
0.120000e 0.118025e 0.118925e 0.120050e 0.119000e 0.122000e 0.120175e
0.120150e 0.118925e 0.121775e
 
FloatStackAvg fe. 119.902500000000E-3  ok
[THEN] \ End block comment

: FloatStackAvg \ Average all values on the floating point stack
fdepth   \ Place the number of floating point values on to the stack (divisor)
dup      \ Duplicate number of floating point values to use as a down counter
begin 1- dup \ Decrement counter and see if it is zero (false)
while    \ while not zero (true)
f+       \ Add two values on the floating point stack
repeat   \ Repeat test at begin word
drop     \ Remove the leftover loop counter value from the stack
s>f      \ Convert the number of floating point values to a float (divisor)
f/ ;     \ Divide sum by number of floating point values to get average

\ Clear any existing values from the floating point stack
fclearstack

\ Place values on floating point stack
0.120000e 0.118025e 0.118925e 0.120050e 0.119000e 0.122000e 0.120175e
0.120150e 0.118925e 0.121775e

FloatStackAvg

fe.
cr

bye
