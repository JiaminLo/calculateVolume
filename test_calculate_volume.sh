#!/bin/bash

assert_equal() {
  expected="$1"
  #  remove the first argument from the arguments
  shift 
  # Send stderr (2) to the same place as stdout (1)
  result=$(./calculate_volume.sh "$@" 2>&1)

  if [ "$result" = "$expected" ]; then
    echo "PASS"
  else
    echo "FAIL: Expected '$expected' but got '$result'"
  fi
}

echo "Test 1: 3 * 4 * 5"
assert_equal "60.00" 3 4 5

echo "Test 2: 2.5 * 4 * 2"
assert_equal "20.00" 2.5 4 2

echo "Test 3: 0 * 4 * 5"
assert_equal "Error: Inputs must be greater than zero." 0 4 5

echo "Test 4: 3 * -4 * 5"
assert_equal "Error: Inputs must be greater than zero." 3 -4 5

echo "Test 5: Input non-number"
assert_equal "Error: All inputs must be valid numbers." a 4 5

echo "Test 6: Missing parameter"
assert_equal "Error: Exactly 3 arguments required." 3 4

echo "Test 7: Extra parameter"
assert_equal "Error: Exactly 3 arguments required." 3 4 5 6
