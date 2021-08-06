CFLAGS=-Wall -Werror -g -Wno-unused
SDIR=src
ODIR=build
EXECUTABLE=$(ODIR)/kernalemu

_OBJS = console.o cbmdos.o screen.o memory.o time.o ieee488.o channelio.o io.o keyboard.o printer.o vector.o c128.o main.o dispatch.o

_HEADERS = c128.h cbmdos.h channelio.h console.h dispatch.h error.h fake6502.h glue.h ieee488.h io.h keyboard.h memory.h printer.h readdir.h screen.h stat.h time.h vector.h

OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))
HEADERS = $(patsubst %,$(SDIR)/%,$(_HEADERS))

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJS) $(HEADERS)
	$(CC) -o $(EXECUTABLE) $(OBJS) $(LDFLAGS)

$(ODIR)/%.o: $(SDIR)/%.c
	@mkdir -p $$(dirname $@)
	$(CC) $(CFLAGS) -c $< -o $@

c64basic: all
	./build/kernalemu demo/basic2.prg -startind 0xa000

c128basic: all
	./build/kernalemu demo/c128basic.prg -start 0x4000 -machine c128

assembler64: all
	./build/kernalemu demo/assembler64.prg

SATA: all
	./build/kernalemu 1.Adventure\ Land.prg -machine vic20 -start 0x7F50

clean:
	rm -rf $(ODIR)
