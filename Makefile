TARGET  = testarea
# ------------------------------------------------------------------------------

SRC     = $(wildcard src/*.c)
OBJ     = $(patsubst src/%.c,src/%.o,$(SRC))
CC      = gcc
CFLAGS  = -fPIC -fprofile-arcs -ftest-coverage
CFLAGS += -Wall -Werror --pedantic -Iinc
LFLAGS  = -lm
RM      = rm -rf

## Build the program
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LFLAGS)

# Pattern rule for compiling .c files into .o files
src/%.o: src/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

## Run code coverage
coverage: all
	./$(TARGET)
	gcov $(SRC)

## Generate lcov report
lcov-report: coverage
	mkdir -p lcov-report
	lcov --capture --directory . --rc lcov_branch_coverage=1 --output-file lcov-report/coverage.info
	genhtml lcov-report/coverage.info --branch-coverage --output-directory lcov-report

## Generate gcovr report
gcovr-report: coverage
	mkdir -p gcovr-report
	gcovr --root . --html --html-details --output gcovr-report/coverage.html

## Clean all generated files
clean:
	$(RM) $(TARGET) src/*.o src/*.gcno src/*.gcda *.gcov lcov-report gcovr-report

## Lint code with clang-format
lint:
	clang-format -i --style=LLVM src/*.c inc/*.h
