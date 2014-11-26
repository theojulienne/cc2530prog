#
# Makefile for cc2530prog
#

CC?=gcc
CFLAGS?=
APP=cc2530prog
GPIO_BACKEND?=gpio-sysfs-omap
bindir=/usr/local/bin

all: $(APP)

%.o: %.c
	$(CC) $(CFLAGS) -DGPIO_BACKEND=$(GPIO_BACKEND) -c $< -o $@

OBJS=$(APP).o $(GPIO_BACKEND).o

$(APP): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

clean:
	rm -f *.o $(APP)

install: $(APP)
	install -m 0755 $(APP) $(DESTDIR)$(bindir)/$(APP)
