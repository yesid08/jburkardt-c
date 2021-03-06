#!/bin/bash
#
gcc -c -I/$HOME/include square_exactness_prb.c
if [ $? -ne 0 ]; then
  echo "Errors compiling square_exactness_prb.c"
  exit
fi
#
gcc square_exactness_prb.o /$HOME/libc/$ARCH/square_exactness.o -lm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading square_exactness_prb.o."
  exit
fi
#
rm square_exactness_prb.o
#
mv a.out square_exactness_prb
./square_exactness_prb > square_exactness_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running square_exactness_prb."
  exit
fi
rm square_exactness_prb
#
echo "Program output written to square_exactness_prb_output.txt"
