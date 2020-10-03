CMP = nim
OPT = c -o:test --run
FN = dual

main:
	$(CMP) $(OPT) ./dual/$(FN).nim

doc:
	$(CMP) doc ./dual/$(FN).nim

leak: main
	valgrind --leak-check=full ./test

clean:
	rm -rf test ./dual/dual

nuke: clean
	rm -rf dual.html nimdoc.out.css
