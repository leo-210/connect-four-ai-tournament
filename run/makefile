all: match

match: tournoi.cmo ia.cmi match.ml ia1.ml ia2.ml
	ocamlc -cmi-file ia.cmi tournoi.cmo ia1.ml
	ocamlc -cmi-file ia.cmi tournoi.cmo ia2.ml
	ocamlfind ocamlopt -linkpkg -package core unix.cmxa -I +unix tournoi.ml ia1.ml ia2.ml match.ml -o match

tournoi.cmo: tournoi.ml
	ocamlc tournoi.ml

ia.cmi: tournoi.cmo ia.mli
	ocamlc tournoi.ml ia.mli

clean:
	rm a.out
	rm *.cmo
	rm *.cmi
	rm *.cmx
	rm *.o
	rm match

.PHONY: all clean
