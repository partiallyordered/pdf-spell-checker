
pdfs := $(wildcard *.pdf)
txts := $(patsubst %.pdf,%.txt,$(pdfs))
outputs := $(patsubst %.pdf,%.txt,$(pdfs))

%.txt: %.pdf
	pdftotext $<

%.err: %.txt
	cat $^ | aspell list --extra-dicts=./okwords.en.pws | sort | uniq

all: $(txts)
	cat $^ | aspell list --extra-dicts=./okwords.en.pws | sort | uniq

.PHONY: all

