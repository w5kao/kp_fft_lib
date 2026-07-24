
CFLAGS=-march=native -Ofast -g -flto -std=gnu99 -W -pedantic -Wcast-qual -Wpointer-arith -Wcast-align \
	-mavx2 -mfma -ffast-math -g -O2 -I../../fftw-bin/include -DVARIABLE_BLOCK_SIDE

LDFLAGS= -static -L../../fftw-bin/lib -lfftw3_threads -lfftw3 -march=native -Ofast -flto -lm -lpthread

cCC=gcc


all: kpfft_test

%.o: %.c
	$(cCC) -c $(CFLAGS) -o $@ $<

kpfft_test: kpfft_test.o kpfft_lib.o my_thr_lib.o aff.o
	$(cCC) -Wall -o $@ $^ $(LDFLAGS)


.PHONY: clean distclean

clean:
	rm -f *.o

distclean: clean 
	rm kpfft_test



