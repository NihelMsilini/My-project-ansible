#!/bin/bash
printf "Today is $(date)"
printf "Memory information\n"
free -m
printf "Disk information\n"
df -h

