
#use the good command

default:
	@echo Use following : 
	@echo      make gcc_win32
	@echo      make gcc_linux

gcc_win32: gif.h gif.c pstdint.h
	gcc -c gif.c -o gif.o -W -Wall -Werror -static-libgcc -Os -s
	ar rvs ugl.a gif.o
	gcc -shared -o ugl.dll gif.o -Wl,--out-implib,ugl_dll.a -lmsimg32 -lgdi32
	gcc --std=c89 gif.c -o test_gif_win32.exe -DGIF_TEST -W -Wall -Werror -static-libgcc -Os -s -lmsimg32 -lgdi32
	
gcc_linux:
	gcc -c -o gif.o -W -Wall -Werror -static-libgcc -Os -s
	ar rvs libugl.a gif.o
	gcc --std=c89 gif.c -o test_gif_linux -DGIF_TEST -W -Wall -Werror -static-libgcc -Os -s -lX11 