#!/usr/bin/env bash

#Script for compiling a C program
tar -zxf NthPrime.tgz #-z uncompress the files, -x extracts the files, -f tells tar that a file name will be given
cd NthPrime || exit #Goes into the NthPrime directory, || exit for shellchack 
gcc main.c nth_prime.c nth_prime.h -o NthPrime #gcc compiles the programs, -o tells it to put the output in the NthPrime directory  
NUMBER=$1 #Creates a varibale
./NthPrime "$NUMBER" #Runs NthPrime taking the variable NUMBER (should be a number but a letter will result in a 0)
