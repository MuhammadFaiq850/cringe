# Source files
SRCS := $(wildcard src/*.c)
# Object files
OBJS := $(patsubst src/%.c, obj/%.o, $(SRCS))

# Compiler and compiler flags
CC := gcc
CFLAGS := -Wno-implicit-function-declaration

# Target name
TARGET := final

# Create the obj directory if it doesn't exist
$(shell mkdir -p obj)

# Target to build the final executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

# Rule to compile source files into object files
obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean rule to remove object files, the executable, and the obj directory
clean:
	rm -rf obj/*.o $(TARGET) obj
