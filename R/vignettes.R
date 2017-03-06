 
outdir <- "./vignettes"
dir.create(outdir)
vdir <- "../pulseR/vignettes/"
files <- dir(vdir, full.names=TRUE)[grep(".Rmd", dir(vdir))]
f <- function(file, out){
  rmarkdown::render(file, output_format=rmarkdown::github_document())
  file_noext <- tools::file_path_sans_ext(file)
  from <- paste0(file_noext, ".md")
  to <- outdir
  file.copy(from, to, overwrite=TRUE)
  from <- paste0(file_noext, "_files")
  if(file.exists(from))
    file.copy(from, to, overwrite=TRUE, recursive=TRUE)
  

}

lapply(files, f, outdir)