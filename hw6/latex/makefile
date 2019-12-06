 LATEX = pdflatex
 PAPER = spain-hw6 #name of main file without ‘‘.tex’’

.SILENT:

.PHONY:
	all clean
main:
	$(PNGFILES)
	$(LATEX) $(PAPER)
	# bibtex $(PAPER)  # if using a bibliography
	pdflatex $(PAPER)

pdfo:
	main  # opens paper after compiling
	open $(PAPER)

pdfoq:
	pdflatex $(PAPER)
	open $(PAPER).pdf

pdfv:
	open $(PAPER)

clean:
	rm -f *.auxa
	rm -f *.lof
	rm -f *.lot
	rm -f *.out
	rm -f *.toc
	rm -f *.xml
	rm -f *.bcf
	rm -f *.bbl
	rm -f *.blg
	rm -f *.log
	rm -f *~


	# rm -rf $(PAPER).lot $(PAPER).run.xml $(PAPER).toc $(PAPER).adx
