#!/bin/bash

# input param1: command name of process
# input param2: user of process
if [ $# -lt 1 ]
then
    echo "Process name unsupplied, exit."
    exit 2                                                                                                                                                                                            
fi

p_command=$1
p_user=$USER
if [ $# -ge 2 ]
then
    if grep $2 /etc/passwd > /dev/null
    then
        p_user=$2
    fi
fi

IFS=$'\n'
for each_row in `ps -u $p_user -o "%p %c %U"| grep $p_command`
do
   IFS=' '
   for each_col in $each_row
   do
        echo $each_col
        # only print column pid
        break
    done
done