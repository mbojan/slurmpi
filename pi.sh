#!/bin/bash

myid=$1
numtask=4
n=4096
n1=$(bc -l <<< $n/$numtask)
h=$( bc -l <<< 1.0/$n)
sum=0.0
istart=$(bc -l <<< $myid*$n1+1)
iend=$(bc -l <<< \($myid+1\)*$n1)

for i in `seq $istart $iend`
do
	x=$(bc -l <<< $h*\($i-0.5\) )
	sum=$(bc -l <<< $sum+\(4.0/\(1.0+$x*$x\)\) )
done

mypi=$( bc -l <<< $h*$sum )
echo $mypi
