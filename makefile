export CC=g++
export CFLAGS=
export LDFLAGS=
export EXEC=deallocator
SRCNAMES= deallocator.cpp
export SRCDIR=src
SRC= $(foreach srcname, $(SRCNAMES), $(SRCDIR)/$(srcname))
OBJNAMES= $(SRCNAMES:.cpp=.o)
export OBJDIR=obj
OBJ= $(foreach objname, $(OBJNAMES), $(OBJDIR)/$(objname))
export BINDIR=bin

export RMDIR= rmdir
export RMFILE= del /s /q
export COPYFILE= copy

compile:bin obj $(OBJNAMES)
	$(CC) -fpic -shared $(OBJ) -o $(BINDIR)/lib$(EXEC).dll

%.o:
	$(CC) -c $(SRCDIR)/$(@:.o=.cpp) -o $(OBJDIR)/$@

.PHONY: compile examples clean

bin:
	mkdir bin

obj:
	mkdir obj

clean:
	$(RMFILE) $(OBJDIR)
	$(RMDIR) $(OBJDIR)
	$(RMFILE) $(BINDIR)
	$(RMDIR) $(BINDIR)





# static:bin obj
# 	g++ -c ./src/deallocator.cpp -o ./obj/deallocator.o
# 	ar rcs ./bin/libdeallocator.a ./obj/deallocator.o

# dynamic:bin obj
# 	g++ -fPIC -c ./src/deallocator.cpp -o ./obj/deallocator.o
# 	g++ -shared -o ./bin/libdeallocator.dll ./obj/deallocator.o

# bin:
# 	mkdir bin

# obj:
# 	mkdir obj