run-best:
	octave Householder.m

run-p1:
	octave Givens.m

run-p2:
	octave GramSchmidt.m

.PHONY: clean
	
clean:
	rm -rf test.in test.out