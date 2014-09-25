SRCS= main.cpp tsc.c nalla_wrapper.c App.cpp Board.cpp Convolve.cpp

CC= /usr/bin/g++
CFLAGS= -c -O3 -Wall -DLINUX -fPIC\
        -I/usr/local/nallatech/FUSE/redist

TARGET=h100bist.exe

OBJS=$(addsuffix .o, $(basename $(notdir $(SRCS))))

all : $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $(OBJS) -ldimesdl -ldl -ldimetalk 

.c.o :
	$(CC) -c $(CFLAGS) $< -o $@ 

.cpp.o :
	$(CC) -c $(CFLAGS) $< -o $@ 

clean :
	rm -f *~ core $(TARGET) $(OBJS)

