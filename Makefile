TARGET  = testarea
# ------------------------------------------------------------------------------
SRC     = $(wildcard src/*.c)
OBJ     = $(pathsubst src/%.c,src/%.o,$(SRC))
CC	= gcc
CFLAGS  = -fPIC -fprofile-arcs -ftest-coverage
CFLAGS += -Wall -Werror --pedantic -Iinc
LFLAGS  = -lm
RM	= rm -rf

## Build the program
all: $(SRC:%.c=%.o)
	$(CC) $(CFLAGS) $(LFLAGS) -o $(TARGET) $^

$(OBJ): $(SRC)
	$(CC) $(CFLAGS) $(LFLAGS) -o $@ $^

## Run code coverage
coverage: 
	./$(TARGET)
	gcov $(SRC)
	
 ## Generate lcov report
lcov-report: coverage
	mkdir lcov-report
	lcov --capture --directory . --rc lcov_branch_coverage=1 --output-file lcov-report/coverage.info
	genhtml lcov-report/coverage.info --branch-coverage --output-directory lcov-report

## Generate gcovr report
gcovr-report: coverage 
	mkdir gcovr-report
	gcovr --root . --html --html-details --output gcovr-report/coverage.html

## Clean all generate files
clean: 
	$(RM) $(TARGET) *.out src/*.o src/*.so src/*.gcno src/*.gcda *.gcov lcov-report gcovr-report

## Lint code with clang-format
lint: 
	clang-format -i --style=LLVM *.c *.h

