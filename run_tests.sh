#!/bin/bash

# Clean previous coverage files
echo "Cleaning previous coverage files..."
rm -f *.gcda *.gcno *.gcov

# Run test cases to ensure coverage
echo "Running test cases..."
echo "Running Test 1"
./testarea c 1 0 0 3.14159265358979323846

echo "Running Test 2"
./testarea r 1 1 0 1

echo "Running Test 3"
./testarea s 1 1 0 1

echo "Running Test 4"
./testarea t 1 1 1 1.5

echo "Running Test 5"
./testarea x 1 0 0 -1

echo "Running Test 6"
./testarea s 1 1 0 -42

# Assemble the coverage statistics
echo "Generating coverage report with gcov..."
gcov src/testarea.c src/area.c

echo "Coverage report generated. Check the .gcov files for details."

