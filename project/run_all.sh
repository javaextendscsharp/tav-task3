#!/bin/bash

# Clean previous build and coverage files
echo "Cleaning previous build and coverage files..."
rm -f ex?? *.o *.gcda *.gcno *.gcov

# Loop through each source file from ex01.c to ex20.c
for i in {01..20}; do
    src_file="ex${i}.c"
    exe_file="ex${i}"

    # Check if the source file exists before attempting to compile
    if [ -f "$src_file" ]; then
        # Compile the source file with coverage flags
        echo "Compiling $src_file with code coverage flags..."
        gcc -fprofile-arcs -ftest-coverage -Wall -Werror -o "$exe_file" "$src_file"

        # Run the compiled program
        echo "Running $exe_file..."
        ./"$exe_file"

        # Generate the coverage report using gcov
        echo "Generating coverage report for $src_file with gcov..."
        gcov "$src_file"
    else
        echo "Source file $src_file does not exist. Skipping..."
    fi
done

echo "All coverage reports generated. Check the .gcov files for details."
