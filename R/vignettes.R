 
outdir <- "./vignettes"
dir.create(outdir)
vdir <- "../pulseR/vignettes/"
files <- dir(vdir, full.names=TRUE)[grep(".Rmd", dir(vdir))]
f <- function(file, out){
  rmarkdown::render(file, output_format=rmarkdown::github_document(),
    output_dir = outdir)
}

lapply(files, f, outdir)