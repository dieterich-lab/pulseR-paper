PAPER=paper
 
paper/paper.pdf: ${PAPER}/paper.tex
	cd paper; pdflatex paper
	cd paper; bibtex paper
	cd paper; pdflatex paper
	cd paper; pdflatex paper

clean: 
	cd paper; \rm -f *.aux *.bbl *.blg *.log *.bak *~ 
	
