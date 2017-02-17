PulseR workflow
================
Alexey Uvarovskii
2017-02-17

``` r
library(pulseR)
set.seed(258)
```

Prepare a data set and conditions
---------------------------------

### The experiment description

Let us have a labelling experiment with several time points

``` r
replicateNum <- 3
time <- c(4,8,12)
geneNum <- 100
```

``` r
formulas <- MeanFormulas(
  total = mu,
  lab   = mu * (1 - exp(-d * time))
)
```

We create a condition matrix with two columns: the first is the condition of samples ("total" or "lab"), the second is the time point.

``` r
conditions <- expand.grid(condition = names(formulas), time = time)
conditions <- conditions[rep(seq_along(conditions$time),
                             each = replicateNum),]
rownames(conditions) <- paste0("sample_", seq_along(conditions$condition))
head(conditions)
```

    ##          condition time
    ## sample_1     total    4
    ## sample_2     total    4
    ## sample_3     total    4
    ## sample_4       lab    4
    ## sample_5       lab    4
    ## sample_6       lab    4

### Generate artificial data

This section is just for reproducibility, you can easily proceed to the next one.

Create the parameters for 100 genes:

``` r
truePar <- list(size = 1e2)
truePar$params <- data.frame(mu = 10 ^ runif(geneNum, 0, 5),
                         d = -log(runif(geneNum, .1, .9)) / 12)
rownames(truePar$params) <- paste0("gene_", 1:geneNum)

fractions <- formula(~ time + condition)
fraction_names <- levels(codeFractions(conditions, fractions))
truePar$fraction_factors <- seq_along(fraction_names)
```

Sample read counts from the negative binomial distribution:

``` r
counts <- generateTestDataFrom(formulas, 
                               truePar,
                               conditions,
                               fractions)
```

Create `PulseData` object
-------------------------

``` r
pd <- PulseData(
    count_data = counts,
    conditions = conditions,
    formulas   = formulas,
    fractions  = ~condition+time)
```

It is important to understand, how the data are normalised. To reduce parameter number, we use the same normalisation as in DESeq package for samples from the *same fraction*. Strictly, we define *fractions* as sets of samples, which have different amounts of RNA, estimated by the model.

### Fitting options

Now we set options for fitting. It is important to provide boundaries for the optimal parameter search:

``` r
opts <- setBoundaries(params = list(mu = c(.5,1e6),
                                    d = c(1e-8,1)),
                      fraction_factors = c(.1,10))
```

For other possible parameters please see "set" functions in the package documentation (`setBoundaries, setTolerance, setFittingOptions`).

### Initial parameter guess

Optimisation procedure may depend on the initial parameter values. A function `initParams` provides an intyerface to simplify this step. There are two options for how to set the parameters:

-   to sample random numbers within the given boundaries
-   manual values by the user

``` r
par <- initParameters(pulseData = pd,
                      options = opts)
```

``` r
#par$params$mu <- guessMeans(pd)
```

Fitting
-------

You can specify other options as the number of cores or error tolerance thresholds for parameter fitting. The fitting procedure will stop, once the difference in parameters values between two subsequent iteration is less than specified in `options$tolerance`.

The function `fitModel` accept the PulseData object, initial guess for the parameters values and fitting options.

``` r
opts$cores <- 2

opts <- setTolerance(params = 1e-3,
                     fraction_factors = 1e-2,
                     options = opts)
result <- fitModel(pd, par, opts)
```

``` r
pr <- predictExpression(pd, result)

plot(pr$predictions, pd$count_data, pch=16, cex=.3, log='xy')
```

    ## Warning in xy.coords(x, y, xlabel, ylabel, log): 35 y values <= 0 omitted
    ## from logarithmic plot

![](fit-fractions_files/figure-markdown_github/unnamed-chunk-12-1.png)
