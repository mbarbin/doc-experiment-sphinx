.PHONY: all
all: build

.PHONY: build
build:
	opam exec -- dune build

.PHONY: test
test:
	opam exec -- dune runtest

.PHONY: fmt
fmt:
	opam exec -- dune build @fmt --auto-promote

.PHONY: lint
lint:
	opam lint
#	opam exec -- opam-dune-lint

.PHONY: deps
deps:
	opam install . --deps-only --with-doc --with-test

.PHONY: doc-common
doc-common: build
	mkdir -p _build/docs
	mkdir -p _build/docs/odoc
	mkdir -p _build/docs/sphinx

sphinx: doc-common
	sphinx-build doc _build/docs/sphinx

.PHONY: odoc
odoc: doc-common
	mkdir -p _build/docs/odoc
	opam exec -- dune build @doc
	rsync -auv --delete _build/default/_doc/_html/. _build/docs/odoc

.PHONY: doc
doc: doc-common odoc sphinx

.PHONY: clean
clean:
	opam exec -- dune clean

.PHONY: check-all
check-all: deps all test doc clean lint fmt
