The raw data are available in the following papers:

1.   Selective transcriptional regulation by Myc in cellular growth control
    and lymphomagenesis. 
    Public on Jul 07, 2014  
    [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4110711/pdf/emss-58841.pdf),
    [geo](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE51011)
    - no spike-ins  
    - no rate estimations
    - only one sample of 10-min 4sU
    - fpkm tables and bed files

2. Rabani M, Levin JZ, Fan L, et al. Metabolic labeling of RNA uncovers 
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
3. Dynamic transcriptome analysis measures rates
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

    
4.  Determinants of RNA metabolism in the Schizosaccharomyces pombe genome  
    Philipp Eser, Leonhard Wachutka, Kerstin C Maier, 
    Carina Demel, Mariana Boroni, Srignanakshi Iyer,
    Patrick Cramer, Julien Gagneur
    [link](http://msb.embopress.org/content/12/2/857.long)  
    [raw](http://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-3653/)
    - NB
    - sample-specific normalisation
    - Uracil bias  
    
        > However, we found that a U-bias correction would have 
        > negligible effects
        > for intron-containing TUs because even their mature RNAs were 
        > generally containing many Us (short TUs
        > were almost all single-exon). 
        > Hence, for typical values of p(4tU replaces U),
        > p(4tUI) was very close to 1 for intron-containing TUs.
    
5. TT-seq by Cramer  
    [link](https://www.ncbi.nlm.nih.gov/pubmed/27257258)
    [raw](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE75792)
    - spike-ins for cross-contamination estimation
    
        > Labeling and modeling approaches that
        > were used so far quantify RNAs as newly synthesized despite the   
        > fact that they carry a non- negligible part of pre-existing RNA.
        > This is introducing a bias especially towards longer
        > genes given our short labeling pulse of 5 minutes
    