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

ifeq ($(OS), Windows_NT)
	RMDIR= rmdir
	RMFILE= del /s /q
	COPYFILE= copy
	SHARED_LIBRARY_EXT= dll
else
ifeq ($(OS), Linux)
	RMDIR= rmdir
	RMFILE= rm
	COPYFILE= cp
	SHARED_LIBRARY_EXT= so
endif
endif

export RMDIR
export RMFILE
export COPYFILE
export SHARED_LIBRARY_EXT

ifeq ($(LIBRARY_TYPE), shared)
else
	ifeq ($(LIBRARY_TYPE), static)
	else
		LIBRARY_TYPE=shared
	endif
endif
export LIBRARY_TYPE

compile:bin obj $(OBJNAMES)
ifeq ($(LIBRARY_TYPE), shared)
	$(CC) -fpic -shared $(OBJ) -o $(BINDIR)/lib$(EXEC).$(SHARED_LIBRARY_EXT)
endif
ifeq ($(LIBRARY_TYPE), static)
	ar rcs $(BINDIR)/lib$(EXEC).a $(OBJ)
endif

%.o:
	$(CC) -c $(SRCDIR)/$(@:.o=.cpp) -o $(OBJDIR)/$@

.PHONY: compile examples clean

bin:
	mkdir bin

obj:
	mkdir obj

clean:
	- $(RMFILE) $(OBJDIR)
	- $(RMDIR) $(OBJDIR)
	- $(RMFILE) $(BINDIR)
	- $(RMDIR) $(BINDIR)





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
