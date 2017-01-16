The raw data are available in the following papers:

* Public on Jul 07, 2014  
    Selective transcriptional regulation by Myc in cellular growth control and lymphomagenesis.
    [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4110711/pdf/emss-58841.pdf),
    [geo](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE51011)
    - no spike-ins  
    - no rate estimations
    - only one sample of 10-min 4sU
    - fpkm tables and bed files

* Rabani M, Levin JZ, Fan L, et al. Metabolic labeling of RNA uncovers 
    principles of RNA production and degradation dynamics in mammalian cells.
    Nature biotechnology. 2011;29(5):436-442. doi:10.1038/nbt.1861.
    [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3114636/#S45title)
    [geo](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE25432)
    - 6 4sU samples (sam files)
    - estimations in xlsx tables
    - gaussian noise model on **fpkm**
    - normalisation on the basis of RNA quantity  
        4.6(+/-)2 10^{-2}
    - 4sU is short -> no degradation in the model for labelling
    - complicated synthesis rate function(6 params)
    - simple degradation rate (1 param)
    - variable parameters in time
* Dynamic transcriptome analysis measures rates
of mRNA synthesis and decay in yeast   
    [link](http://msb.embopress.org/content/7/1/458.long)
    - microarray by Cramer
* Global quantification of mammalian gene expression control    
    [link](http://www.nature.com/nature/journal/v473/n7347/full/nature10098.html)  
    [estimations](http://www.nature.com/nature/journal/v473/n7347/extref/nature10098-s5.xls)
    [raw seq](https://www.ncbi.nlm.nih.gov/sra?term=SRA030871)
    - normalisation by regression as in  microarray
       [link](http://rnajournal.cshlp.org/content/14/9/1959.long)
    - 3 fractions
    - excluded transcripts with not desired ratios (L/total) > 1 (!)

    

    