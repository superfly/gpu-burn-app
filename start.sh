#!/bin/bash
stress -c $(grep -wc vendor_id /proc/cpuinfo) &
./gpu_burn 1200
