#!/bin/bash

for i in *gz; 
do 
        j=${i%.log*}; 
        k=${j#*20}; 
        echo 20"${k}: `zcat $i | wc -l`"; 
done

