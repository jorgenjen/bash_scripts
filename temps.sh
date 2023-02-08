#!/bin/bash
# Simple file to check CPU and GPU temps. Might only work on my computer/setup
gpu_temps=($(cat /sys/class/thermal/thermal_zone*/temp))

echo GPU Temps in Celsius:
echo \  $(awk '{print $1/1000}' <<< "${gpu_temps[0]}") 
echo \  $(awk '{print $1/1000}' <<< "${gpu_temps[1]}") 
echo \  $(awk '{print $1/1000}' <<< "${gpu_temps[2]}") 

# Need to know the number of cpu cores in processor to print them all out
cpu_cores=6

function cpu_temps {
    i=0
    echo \  $(sensors | grep "Package")
    while [ $i -lt $cpu_cores ]
    do
        echo \  \  $(sensors | grep "Core ${i}")
        ((i++))
    done
}

echo 
echo CPU temps:
cpu_temps
