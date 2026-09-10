CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2

TARGET = app
SOURCE = main.cpp
BUILD_DIR = build
OBJECT = $(BUILD_DIR)/main.o

all: $(TARGET)

$(TARGET): $(OBJECT)
	$(CXX) $(CXXFLAGS) $(OBJECT) -o $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(OBJECT): $(SOURCE) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $(SOURCE) -o $(OBJECT)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf $(BUILD_DIR) $(TARGET)

rebuild: clean all

.PHONY: all run clean rebuild
