#!/bin/bash

echo "Cleaning previous build and coverage files..."
rm -f ex?? *.o *.gcda *.gcno *.gcov

for i in {01..20}; do
    src_file="ex${i}.c"
    exe_file="ex${i}"

    if [ -f "$src_file" ]; then
        echo "Compiling $src_file with code coverage flags..."
        gcc -fprofile-arcs -ftest-coverage -Wall -Werror -o "$exe_file" "$src_file"

        echo "Running $exe_file..."
        ./"$exe_file"

        echo "Generating coverage report for $src_file with gcov..."
        gcov "$src_file"
    else
        echo "Source file $src_file does not exist. Skipping..."
    fi
done

echo "All coverage reports generated. Check the .gcov files for details."


