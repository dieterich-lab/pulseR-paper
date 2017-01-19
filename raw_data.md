
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
    - only fastq available
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
        
    - gtf + count table for transcription units. gtf line number is not
        compatible with any TU number in the paper. No possibility to
        join this tables.

6. Marzi MJ, Ghini F, Cerruti B, de Pretis S et al. Degradation dynamics
    of microRNAs revealed by a novel pulse-chase approach. 
    Genome Res 2016 Apr;26(4):554-65. PMID: 26821571 
    [link](http://genome.cshlp.org/content/26/4/554.full.pdf+html)
    [raw table](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE72655)
    - miRNA 4sU
    - InSPECT on rpkms
    - raw count table available
    - rate estimation in xlsx
    
7. The Biogenesis of Nascent Circular RNAs  
    [link](http://www.sciencedirect.com/science/article/pii/S2211124716303291)  
    [raw bw](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE73325)
    - super short labelling 
    - aim to measure elongation rate, but not metabolism
    
8. Determination of in vivo RNA kinetics using RATE-seq   
    [link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4174445/pdf/1645.pdf)
   [raw counts](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4174445/bin/supp_20_10_1645__index.html)
   
   -  least squares model
   
    > We studied the mean-varance relationship at each time point and found that the data
    > are overdispersed (Supplemental Fig. S10). Therefore, to estimate
    > the degradation rate constant for individual transcripts
    > we performed a nonlinear weighted regression using normalized 
    > counts from the combined data set (Fig. 2B) (Materials
    > and Methods). We determined confidence intervals for the es-
    > timated decay constant for each transcript using bootstrapped
    > values from each time-point 
    
    - normalised counts in suppl., maybe it's possible to recover the raw
        and the spike-ins
      
9. Uwe Ohler.  
    Integrative classification of human coding and noncoding
    genes through RNA metabolism profiles.  
    [link](http://www.nature.com/nsmb/journal/v24/n1/pdf/nsmb.3325.pdf)  
    [raw tables](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE84722)  
   - INSPEcT
   - processing in the model
   
   >  For each gene, we calculated the expression of 
   > ‘mature’ RNA as the sum of all isoforms for that gene excluding
   > the ‘primary’ transcript. For intronless genes, primary and 
   > mature expression values were summed.
   
   - artifacts  
   
   > Rates estimated from 7 and 15 min were systematically higher
   > and exhibited a larger coefficient of variation (data not shown) 
   > that could potentially have been 
   > resolved by more efficient biotin conjugation methods
   
   - RSEM counts available for mature/primary RNA for total
   - TPM only for labelling experiments (for
   - no spike-ins, except total in order to estimate copies per cell 
   
   

10. DRiLL  (the continuation of the [2])
    [paper](http://www.cell.com/cell/pdfExtended/S0092-8674(14)01446-9)  
    [software site with raw count examples](https://portals.broadinstitute.org/rnalifecycle#download_data)  
    [geo raw counts](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE56977)
    - proprietary  
    - binomial model for mean count estimation
    - include processing in the model
    - LR test to choose between constant vs. changing rates
    - contamination with unlabelled estimated: 30.2%!
    - strange, that normalisation of laballed fraction is the same for 
        different time points