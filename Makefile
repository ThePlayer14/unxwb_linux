# Makefile for unxwb from http://aluigi.altervista.org/papers.htm
# NOTE: You must have the zlib development headers installed
#
# Instructions:
# - `make` or `make build` to build a native binary.
# - `make multiarch` to build 64-bit and 32-bit binaries on a 64-bit system
# - `make dist` to produce an optimized zip file from "make multiarch"
#   (Also requires `advzip` from AdvanceCOMP installed)

CC = gcc
CFLAGS = -O2
SHELL = /bin/sh

# NOTE: `make dist` is not yet compatible with a custom srcdir
srcdir = .

# IMPORTANT: unxwb.c must be the first in the list so $< chooses it
FILES = unxwb.c mywav.h myxact.h xma_header.h
RELEASE_ZIP = ../unxwb-ubuntu12.04-x86_64.zip

# Prevent any implicit rules from applying
.SUFFIXES:

# List of rules that the system understands as commands rather than files
.PHONY: build clean dist multiarch

# The first rule listed is the default
build: unxwb

clean:
	-rm -f unxwb unxwb.x86 unxwb.x86_64 "$(RELEASE_ZIP)"

dist: $(RELEASE_ZIP)

multiarch: unxwb.x86_64 unxwb.x86

unxwb unxwb.x86_64: $(FILES)
	$(CC) -I$(srcdir) $(CFLAGS) $< -o $@ -lz

unxwb.x86: $(FILES)
	$(CC) -I$(srcdir) $(CFLAGS) $< -o $@ -lz -m32

$(RELEASE_ZIP): .* *
	rm -f "$(RELEASE_ZIP)"
	zip -rT -xunxwb "$(RELEASE_ZIP)" .
	advzip -z4 "$(RELEASE_ZIP)"

