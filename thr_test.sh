#!/bin/bash

cpupower frequency-set -g performance

for i in {0..4}; do
	./kpfft_test 12288 12288 5 $i 12k_thr_test.dat
done

for i in {5..8}; do
	./kpfft_test 12288 12288 10 $i 12k_thr_test.dat
done
