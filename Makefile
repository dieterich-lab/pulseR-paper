PAPER=paper
 
knit:
	Rscript -e  'library(rmarkdown); render("R/test.Rmd", "all")'

paper/paper.pdf: ${PAPER}/paper.tex
	cd paper; pdflatex paper
	cd paper; bibtex paper
	cd paper; pdflatex paper
	cd paper; pdflatex paper
	
vignettes: R/vignettes.R ../pulseR/vignettes/*
	Rscript R/vignettes.R > Rout/vignettes.Rout

clean: 
	cd paper; \rm -f *.aux *.bbl *.blg *.log *.bak *~ 
	
