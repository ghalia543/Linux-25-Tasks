#!/bin/bash

countdown() {
  local count=$1
  while [ $count -gt 0 ]; do
    echo "$count"
    ((count--))
    sleep 1
  done
  echo "Time's up!"
}

echo "Enter the starting number for countdown: "
read start_number
countdown $start_number
