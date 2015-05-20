# A cheeky Makefile for creating a child process.

all:	gencode build install run

gencode:	diploid
	# This step depends upon mixing code from two different programmers to
	# form a new program.
	# In the biology world, we're creating a diploid.

diploid:	fertilization
	# To create a diploid, we require fertilization of an egg.

fertilization:	male.c female.c
	# Fertilization requires mixing code from male and female.
	join -t' ' male.c female.c | sed -r -e 's/^[0-9]+ //' > child.c

child.c:	fertilization

build:	fertilization mitosis
	# To build the child process, we first start with a diploid, then
	# proceed with mitosis and let it compile for roughly 9 months.

mitosis:	child.c
	gcc -o child child.c; rm -f child.c
	@echo sleep $$((40*7*24*3600))
	@sleep 9

install:	deliver

deliver:
	# Child process delivery sometimes takes a good chunk of time of
	# waiting at a hospital.
	@echo sleep $$(($$RANDOM%(24*3600)))
	@sleep 2
	chmod u+x,g+x,o= child

run:	cry

cry:
	./child
