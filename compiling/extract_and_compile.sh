#!/usr/bin/env bash

#Script for compiling a C program
tar -zxf NthPrime.tgz #-z uncompress the files, -x extracts the files, -f tells tar that a file name will be given
cd NthPrime #Goes into the NthPrime directory 
gcc main.c nth_prime.c nth_prime.h -o NthPrime #gcc compiles the programs, -o tells it to put the output in the NthPrime directory  
