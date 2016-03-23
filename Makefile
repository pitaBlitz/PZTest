IDIR =./include
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=./obj
LDIR=./lib

_DEPS= hello.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = helloMain.o helloFunc.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hello: $(OBJ)
	gcc -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
