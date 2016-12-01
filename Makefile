#! /usr/bin/env make

SRCDIR		= src

FONTSIZE	= 12pt
LIBDIR		= ./lib
TEMPLATE	= ${LIBDIR}/template.revealjs
HTEMPLATE	= ${LIBDIR}/header-template.md
PANDOCOPTS	=  --standalone \
		   --smart \
		   --toc \
		   --toc-depth=2#\
		  #--variable fontsize=${FONTSIZE}

all:: slides

slides::
	pandoc ${SRCDIR}/*.md ${PANDOCOPTS} \
	  -t revealjs \
	  -V slideNumber='c / t' \
	  -V theme=black \
	  --template=${TEMPLATE} \
	  -o $@.html

clean::
	rm -f ${OUTPUT}.*
