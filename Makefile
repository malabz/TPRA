cc = g++
prom = TPRA
source = src/ensemble.cc src/Fasta.cc

$(prom): $(source)
	$(cc) -std=c++2a -O2 -o $(prom) $(source)
