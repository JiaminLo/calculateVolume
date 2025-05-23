#!/bin/bash
# import files

assert_equal() {
  expected="$1"
  shift
  result=$(./calculate_volume.sh "$@")

  if [ "$result" == "$expected" ]; then
    echo "PASS"
  else
    echo "FAIL: Expected '$expected' but got '$result'"
  fi
}

echo "Test 1: 3 * 4 * 5"
assert_equal "60" 3 4 5

echo "Test 2:2.5*4*2"
assert_equal "20.0" 2.5 4 2

echo "Test 3:0*4*5"
# assert_equal "0" 0 4 5
./calculate_volume.sh 0 4 5

echo "Test 4:3*-4*5"
# assert_equal  "-60" 3 -4 5
./calculate_volume.sh 3 -4 5

echo "Test 5: Input non number (a*4*5)"
# assert_equal "0" a 4 5
./calculate_volume.sh a 4 5

echo "Test 6: Maximum value test"
assert_equal "9999999999999999999800000000000000000000" 100000000000 100000000000 999999999999

echo "Test 7: Minimum value test"
assert_equal "0.00000000000000000001" 0.0000000001 0.0000000001 1

echo "Test 8: Parameter less than 3"
# assert_equal "0" 3 4
./calculate_volume.sh 3 4

echo "Test 9: Parameter more than 3"
# assert_equal "60" 3 4 5 6
./calculate_volume.sh 3 4 5 6

# echo "Test 10: Scientific notation(3e1*4*5)" 
