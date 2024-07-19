#! /usr/bin/gforth
: mod_loop
1
begin dup 100 <=
while
dup
21
* 60 mod . cr
1 +
repeat ;

mod_loop

bye
