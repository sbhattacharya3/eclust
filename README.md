[![Travis-CI Build Status](https://travis-ci.org/sahirbhatnagar/manhattanly.svg?branch=master)](https://travis-ci.org/sahirbhatnagar/manhattanly)

<!--
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/manhattanly)](https://cran.r-project.org/package=manhattanly)
![](http://cranlogs.r-pkg.org/badges/manhattanly?color=yellow)
![](http://cranlogs.r-pkg.org/badges/grand-total/manhattanly?color=yellowgreen)
-->


# eclust

The `eclust` package implements the methods developped in the paper *A model for interpretable high dimensional interactions*. Breifly, `eclust` is a two-step procedure: 1a) a clustering stage where variables are clustered based on some measure of similarity, 1b) a dimension reduction stage where a summary measure is created for each of the  clusters, and 2) a simultaneous variable selection and regression stage on the summarized cluster measures.

## Installation

<!--You can install `eclust` from [CRAN](https://cran.r-project.org/web/packages/manhattanly/):

```R
install.packages("manhattanly")
```
-->

You can install the development version of `eclust` from [GitHub](https://github.com/sahirbhatnagar/eclust) with:

```R
install.packages("devtools")
devtools::install_github("sahirbhatnagar/eclust", build_vignettes = TRUE)
```



## Vignette

See the [online vignette](http://sahirbhatnagar.com/eclust/) for example usage of the functions.

## Credit

This package is makes use of several existing packages including:

* [`glmnet`](https://cran.r-project.org/web/packages/glmnet/index.html) for lasso and elasticnet regression
* [`earth`](https://cran.r-project.org/web/packages/earth/index.html) for MARS models
* [`WGCNA`](https://cran.r-project.org/web/packages/WGCNA/index.html) for topological overlap matrices


## Related Work

1. Park, M. Y., Hastie, T., & Tibshirani, R. (2007). Averaged gene expressions for regression. _Biostatistics_, 8(2), 212-227.
2. Bühlmann, P., Rütimann, P., van de Geer, S., & Zhang, C. H. (2013). Correlated variables in regression: clustering and sparse estimation. _Journal of Statistical Planning and Inference_, 143(11), 1835-1858.


## Contact

* Issues: <https://github.com/sahirbhatnagar/eclust/issues>
* Pull Requests: <https://github.com/sahirbhatnagar/eclust/>
* e-mail: <sahir.bhatnagar@gmail.com>


## Latest news

You can see the most recent changes to the package in the [NEWS.md file](https://github.com/sahirbhatnagar/eclust/blob/master/NEWS.md)



## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
