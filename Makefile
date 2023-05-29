CC = gcc
CFLAGS = -Wall
TARGET = foldercrypt
SRC = foldercrypt.c

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)
