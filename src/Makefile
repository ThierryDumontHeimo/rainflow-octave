

rainflow.mex: rainflow.c
	mkoctfile --mex --strip rainflow.c
	
clean:
	rm -f rainflow.mex rainflow.o

test: rainflow.mex
	octave ./rfc-test.m | grep -i -e error -e conclusion
