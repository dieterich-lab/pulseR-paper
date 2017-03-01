PulseR with spike-ins
================
Uvarovskii Alexey
2017-03-01

``` r
library(pulseR)
attach(pulseRSpikeinsData)
```

Prepare a data set and conditions
---------------------------------

### The experiment description

Let us have a labelling experiment with several time points

``` r
formulas <- MeanFormulas(
  A = a,
  B =  a * b ^ time,
  C = alpha * a * (1 - b ^ time))

formulaIndexes <- list(
  A_samp = 'A',
  B_samp = c('B', 'C'),
  C_samp = c('B', 'C'))
```

Let \(alpha\) be some parameter shared between genes and \(a\), \(b\) are the gene specific parameters.

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

Spikeins in data
----------------

The count matrix consists of the read counts for the features of interest as well as counts for the spike-ins, which are specified by row names.

``` r
counts[,1:4]
```

    ##                 A_samp      A_samp      A_samp       B_samp
    ##            100132.0000  99843.0000 100614.0000 1.136970e+05
    ##            200949.0000 199742.0000 200436.0000 3.525750e+05
    ##            299947.0000 299812.0000 301966.0000 4.726470e+05
    ##            402735.0000 397831.0000 399445.0000 3.465930e+05
    ##            503675.0000 503351.0000 500446.0000 7.040880e+05
    ##            597328.0000 601121.0000 601301.0000 6.828420e+05
    ##            697147.0000 703352.0000 698191.0000 7.755200e+05
    ##            797871.0000 798010.0000 798683.0000 1.477658e+06
    ##            899497.0000 898192.0000 901346.0000 1.727296e+06
    ##           1000624.0000 998589.0000 994578.0000 1.665592e+06
    ## spikes 1     2492.4033   2492.4033   2492.4033 4.984807e+03
    ## spikes 2     5442.6017   5442.6017   5442.6017 1.088520e+04
    ## spikes 3     5358.0549   5358.0549   5358.0549 1.071611e+04
    ## spikes 4     9938.7163   9938.7163   9938.7163 1.987743e+04
    ## spikes 5     5546.2605   5546.2605   5546.2605 1.109252e+04
    ## spikes 6     6802.3159   6802.3159   6802.3159 1.360463e+04
    ## spikes 7     1337.8202   1337.8202   1337.8202 2.675640e+03
    ## spikes 8      246.0163    246.0163    246.0163 4.920326e+02
    ## spikes 9     3178.4526   3178.4526   3178.4526 6.356905e+03
    ## spikes 10    2728.5448   2728.5448   2728.5448 5.457090e+03
    ## spikes 11    2492.4033   2492.4033   2492.4033 2.492403e+02
    ## spikes 12    5442.6017   5442.6017   5442.6017 5.442602e+02
    ## spikes 13    5358.0549   5358.0549   5358.0549 5.358055e+02
    ## spikes 14    9938.7163   9938.7163   9938.7163 9.938716e+02
    ## spikes 15    5546.2605   5546.2605   5546.2605 5.546261e+02
    ## spikes 16    6802.3159   6802.3159   6802.3159 6.802316e+02
    ## spikes 17    1337.8202   1337.8202   1337.8202 1.337820e+02
    ## spikes 18     246.0163    246.0163    246.0163 2.460163e+01
    ## spikes 19    3178.4526   3178.4526   3178.4526 3.178453e+02
    ## spikes 20    2728.5448   2728.5448   2728.5448 2.728545e+02

Since usually it is interesting to consider cross-contamination between labelled and unlabelled fractions, we need to specify spike-ins sets for these fractions. For example, the samples from the group "B\_samp" are contaminated with the "C" fraction. Hence, we need to provide to lists of spike-ins for the "B\_samp" samples: for the "B" fraction and for the "C" fraction.

``` r
spikeins$spikeLists$B_samp
```

    ## [[1]]
    ##  [1] "spikes 1"  "spikes 2"  "spikes 3"  "spikes 4"  "spikes 5" 
    ##  [6] "spikes 6"  "spikes 7"  "spikes 8"  "spikes 9"  "spikes 10"
    ## 
    ## [[2]]
    ##  [1] "spikes 11" "spikes 12" "spikes 13" "spikes 14" "spikes 15"
    ##  [6] "spikes 16" "spikes 17" "spikes 18" "spikes 19" "spikes 20"

It is very important to specify the reference group of samples, which will be used for estimation of sequencing depth correction.

``` r
spikeins$refGroup
```

    ## [1] "A_samp"

Create `PulseData` object
-------------------------

``` r
pd <- PulseData(
  counts = counts,
  conditions = conditions,
  formulas = formulas,
  formulaIndexes = formulaIndexes,
  spikeins = spikeins
)
```

### Fitting options

Now we set options for fitting. It is important to provide boundaries for the optimal parameter search:

``` r
opts <- setBoundaries(list(
  a = c(.1, 1e6),
  b = c(.01, .99),
  alpha = c(.1,10)
))
```

For other possible parameters please see "set" functions in the package documentation (`setBoundaries, setTolerance, setFittingOptions`).

### Initial parameter guess

Optimisation procedure may depend on the initial parameter values. A function `initParams` provides an intyerface to simplify this step. There are two options for how to set the parameters:

-   to sample random numbers within the given boundaries
-   manual values by the user

``` r
initPars <- initParameters(par, c("a", "b"), pulseData = pd, options = opts)
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
