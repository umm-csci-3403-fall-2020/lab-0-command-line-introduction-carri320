#!/usr/bin/env bash

SCRATCH=$(mktemp --directory) #creates a scratch directory called mktemp
ARCHIVE=$1 #Creates a variable that will be used for the .tgz files
tar -zxf "$ARCHIVE" -C "$SCRATCH" #-z uncompress the files, -x extracts the files, -f tells tar that a file name will be given. -C tells these things to happen in a specified directory.
CURRENTPOS=$(pwd) #Saves the current position, pwd prints the path for working directory (from root)
cd "$SCRATCH" #Goes into the mktemp directory
grep -Rl "DELETE ME!" . | xargs rm #-r searches recursively, -l limits the output to only ones with the specified phrase, xargs rm then says to remove the ones with the specified phrase
ARCHIVE_NAME_ONLY=$(basename -s .tgz "$ARCHIVE") #This gets just the name of the .tgz file without the file type. basename prints the file name, -s removes file extension. 
tar -zcf cleaned_"$ARCHIVE" "$ARCHIVE_NAME_ONLY" 
mv cleaned_"$ARCHIVE" "$CURRENTPOS" #(For this and previous line) Creates the new compressed archive. -z uncompress the files, -c compresses the files, -f tells tar that a file name will be given. cleaned_ will be added to the front of the compressed archive


# deleting the scratch dir
cd "$SCRATCH" #Goes into mktemp
rm -rf "$SCRATCH" #removes mktemp
