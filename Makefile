ifneq ($(CROSS_COMPILE),)
CROSS-COMPILE:=$(CROSS_COMPILE)
endif
CC:=$(CROSS-COMPILE)gcc
LD:=$(CROSS-COMPILE)ld
CFLAGS=-c -Wall -s
LDFLAGS=
LIBS=-lpthread -ldl
SOURCES=QmiWwanCM.c GobiNetCM.c main.c MPQMUX.c QMIThread.c util.c udhcpc.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=quectel-cm

.PHONY: all clean

all: $(SOURCES) $(EXECUTABLE)
    
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@ $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJECTS) $(EXECUTABLE)

