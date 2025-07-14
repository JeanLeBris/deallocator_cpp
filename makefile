static:bin obj
	g++ -c ./src/deallocator.cpp -o ./obj/deallocator.o
	ar rcs ./bin/libdeallocator.a ./obj/deallocator.o

dynamic:bin obj
	g++ -fPIC -c ./src/deallocator.cpp -o ./obj/deallocator.o
	g++ -shared -o ./bin/libdeallocator.dll ./obj/deallocator.o

bin:
	mkdir bin

obj:
	mkdir obj