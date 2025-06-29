#!/bin/bash

calculate_volume() {
  if [ $# -ne 3 ]; then
    echo "Error: Exactly 3 arguments required."
    exit 1
  fi
  # Check if all arguments are valid numbers
  for arg in "$@"; do
    if ! [[ "$arg" =~ ^-?[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?$ ]]; then
      echo "Error: All inputs must be valid numbers."
      exit 1
    fi

    if (( $(echo "$arg <= 0" | bc -l) )); then
      echo "Error: Inputs must be greater than zero."
      exit 1
    fi
  done
  # Calculate and format with 2 decimal places
  result=$(echo "scale=2; $1 * $2 * $3" | bc -l)
  printf "%.2f\n" "$result"  # Ensures two decimal places
}
# Call the function when the script is executed
calculate_volume "$@"
