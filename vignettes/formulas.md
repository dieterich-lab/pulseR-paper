Formula creation
================
Uvarovskii Alexey
2017-03-23

In the `pulseR` package, one must provide formulas which estimate the amount of RNA in the samples depending on the condition. The fitting procedure optimise parameter values in such a way, that the likelihood of the observed read numbers in the samples is maximal, see [MLE](https://en.wikipedia.org/wiki/Maximum_likelihood_estimation).

There are two possibilities to define the formulas, which describe RNA amount changes: by providing your own expressions or using implemented helper functions.

### Manually

Create formulas manually:

``` r
forms <- MeanFormulas(
  total = mu,
  labelled = mu * exp(-d * time)
)
forms
#> $total
#> mu
#> 
#> $labelled
#> mu * exp(-d * time)
```

The formula itself is an unevaluated R expression and can be evaluated at given parameter values, for example:

``` r
eval(forms$labelled, list(mu=10, d=1, time=2))
#> [1] 1.353353
```

### Using functions

Alternatively, you may use implemented function. Let us consider a labelling experiment.

To introduce a simple name or equation, use the function `amount`

``` r
total <- amount("mu")
total
#> mu
```

which is the same as `quote(mu)`. The unlabelled fraction is degrading during the pulse experiment. Here we use `total` as the initial value for the unlabelled fraction degradation:

``` r
unlab <- degrade(total, "d", "time_L")
unlab
#> mu * exp(-d * time_L)
```

In contrast, the labelled fraction is being synthesized, and grows from the initial zero value:

``` r
lab <- growFrom0(total, "d", "time_L")
lab
#> mu * (1 - exp(-d * time_L))
```

If the initial value is other than zero, use the function `grow`. For example, we make a chase experiment for time `time_C` after labelling for time `time_L`. The unlabelled fraction will start to grow then from the level `unlab`:

``` r
unlab_chase <- grow(unlab, total, "d", "time_C")
unlab_chase
#> mu - (mu - mu * exp(-d * time_L)) * exp(-d * time_C)
```

To use the created functions, one must to gather them in one list with the proper naming of the fractions:

``` r
forms <- list(
  total = total,
  unlab = unlab,
  label = lab)
forms
#> $total
#> mu
#> 
#> $unlab
#> mu * exp(-d * time_L)
#> 
#> $label
#> mu * (1 - exp(-d * time_L))
```

##### Non-standard evaluation functions

Functions `grow`, `degrade` and `amount` have versions which use the non-standard evaluation, namely `grow_`, `degrade_` and `amount_`. The first argument provided, must be an expression or a character string. Other parameters, however, will be used in the form they were defined on input.

Usage example:

``` r
degrade_(total, rate, time +1)
#> mu * exp(-rate * (time + 1))
grow_(unlab, mu, rate, time +1)
#> mu - (mu - mu * exp(-d * time_L)) * exp(-rate * (time + 1))
```
