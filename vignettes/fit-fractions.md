PulseR workflow
================
Alexey Uvarovskii
2017-03-01

``` r
library(pulseR)
set.seed(258)
```

Prepare a data set and conditions
---------------------------------

### The experiment description

Let us have a labelling experiment with several time points

``` r
attach(pulseRFractionData)
```

``` r
formulas <- MeanFormulas(A = a * p,
                         B =  a * b ^ time,
                         C = a * (1 - b ^ time))
```

Here is the condistion matrix for our data set:

``` r
conditions
```

    ##           condition time
    ## sample_1     A_samp    1
    ## sample_2     A_samp    2
    ## sample_3     A_samp    3
    ## sample_4     B_samp    1
    ## sample_5     B_samp    2
    ## sample_6     B_samp    3
    ## sample_7     C_samp    1
    ## sample_8     C_samp    2
    ## sample_9     C_samp    3
    ## sample_10    A_samp    1
    ## sample_11    A_samp    2
    ## sample_12    A_samp    3
    ## sample_13    B_samp    1
    ## sample_14    B_samp    2
    ## sample_15    B_samp    3
    ## sample_16    C_samp    1
    ## sample_17    C_samp    2
    ## sample_18    C_samp    3
    ## sample_19    A_samp    1
    ## sample_20    A_samp    2
    ## sample_21    A_samp    3
    ## sample_22    B_samp    1
    ## sample_23    B_samp    2
    ## sample_24    B_samp    3
    ## sample_25    C_samp    1
    ## sample_26    C_samp    2
    ## sample_27    C_samp    3

Create `PulseData` object
-------------------------

``` r
pd <- PulseData(
  counts = counts,
  conditions = conditions,
  formulas = formulas,
  formulaIndexes = formulaIndexes,
  groups = fractions
)
```

It is important to understand, how the data are normalised. To reduce parameter number, we use the same normalisation as in the DESeq package for samples from the *same fraction*. Strictly speaking, we define *fractions* as sets of samples, which have different amounts of RNA, estimated by the model.

### Fitting options

Now we set options for fitting. It is important to provide boundaries for the optimal parameter search:

``` r
opts <- setBoundaries(list(
  a = c(.1, 1e6),
  b = c(.01, .99),
  normFactors = c(.1, 50)
))
```

For other possible parameters please see "set" functions in the package documentation (`setBoundaries, setTolerance, setFittingOptions`).

### Initial parameter guess

Optimisation procedure may depend on the initial parameter values. A function `initParams` provides an intyerface to simplify this step. There are two options for how to set the parameters:

-   to sample random numbers within the given boundaries
-   manual values by the user

``` r
initPars <- list(p = pulseRFractionData$par$p)
initPars <- initParameters(initPars, c("a", "b"), pulseData = pd, options = opts)
```

``` r
#par$params$mu <- guessMeans(pd)
```

Fitting
-------

You can specify other options as the number of cores or error tolerance thresholds for parameter fitting. The fitting procedure will stop, once the difference in parameters values between two subsequent iteration is less than specified in `options$tolerance`.

The function `fitModel` accept the PulseData object, initial guess for the parameters values and fitting options.

``` r
opts <- setTolerance(params = 1e-3,
                     normFactors = 1e-2,
                     options = opts)
result <- fitModel(pd, initPars, opts)
```

``` r
pr <- predictExpression(pd, result)

plot(
  x = as.vector(pr$predictions),
  y = as.vector(pd$counts),
  pch = 16,
  cex = .3,
  log = 'xy',
  xlab = "fitted",
  ylab = "experiment"
  )
```

![](fit-fractions_files/figure-markdown_github/unnamed-chunk-10-1.png)
