## Software for similar experiments

* HALO framework  
    [link](http://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/bioinformatics/26/9/10.1093/bioinformatics/btq117/2/btq117.pdf?Expires=1485080067&Signature=StIQtKtD73CNSuAtqPMvdFQjde~QPyxVeCn4p94LnjKjjzFMYEzJxVWYx94TvC-P~WYfFo4eDKz3Q8B8SK01LB2cl8AzWhxIBY39B4u1chKuQrkjNhX~39DkEOsoD0e9g7~C9MeNRjDEQKiaq0HjjzTRDQ~7-H9c6fXctaeCPmulz1SL4rfLq8OW5U~nQI14ePcg4VTLJsWP3-H3NlZ1NTPXXEHh0lzPyALhSlX4TJps6xjCs-bfk76gvY69JheJ954DySa6JIW8XGLJEYLDp7h2UB7IoGoxxrkme8lekgfkp~3112DcxECnzdWhajrhA8eXlYaF35TuGuqPO3qG8g__&Key-Pair-Id=APKAIUCZBIA4LVPAVW3Q)
    - Java + gui (all links to download are broken)
    - the same processing for microarray and rna-seq (LSE?)
    - normalisation by regression  (Doelken 2008)
    - filtering by expression
    - used in [paper](http://nar.oxfordjournals.org/content/44/3/1370.full)

* DRiLL  
    [paper](http://www.cell.com/cell/pdfExtended/S0092-8674(14)01446-9)  
    [software site with raw count examples](https://portals.broadinstitute.org/rnalifecycle#download_data)  
    [geo raw counts](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE56977)
    - proprietary  
    - binomial model for mean count estimation
    - include processing of RNA in the model
    - LR test to choose between constant vs. changing rates
    - fitting by LSE
    - strange, that normalisation of laballed fraction is the same for 
        different time points
    