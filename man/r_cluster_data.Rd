% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rda_functions.R
\name{r_cluster_data}
\alias{r_cluster_data}
\title{Cluster data using environmental exposure}
\usage{
r_cluster_data(data, response, exposure, train_index, test_index,
  cluster_distance = c("corr", "corr0", "corr1", "tom", "tom0", "tom1",
  "diffcorr", "difftom", "fisherScore"), eclust_distance = c("fisherScore",
  "corScor", "diffcorr", "difftom"), measure_distance = c("euclidean",
  "maximum", "manhattan", "canberra", "binary", "minkowski"),
  minimum_cluster_size = 50, ...)
}
\arguments{
\item{data}{n x p matrix of data. rows are samples, columns are genes or cpg
sites. Should not contain the environment variable}

\item{response}{numeric vector of length n}

\item{exposure}{binary (0,1) numeric vector of length n for the exposure
status of the n samples}

\item{train_index}{numeric vector indcating the indices of \code{response}
and the rows of \code{data} that are in the training set}

\item{test_index}{numeric vector indcating the indices of \code{response} and
the rows of \code{data} that are in the test set}

\item{cluster_distance}{character representing which matrix from the training
set that you want to use to cluster the genes. Must be one of the following
\itemize{ \item corr, corr0, corr1, tom, tom0, tom1, diffcorr, difftom,
corScor, tomScor, fisherScore }}

\item{eclust_distance}{character representing which matrix from the training
set that you want to use to cluster the genes based on the environment. See
\code{cluster_distance} for avaialble options. Should be different from
\code{cluster_distance}. For example, if \code{cluster_distance=corr} and
\code{EclustDistance=fisherScore}. That is, one should be based on
correlations ignoring the environment, and the other should be based on
correlations accounting for the environment. This function will always
return this add on}

\item{measure_distance}{one of "euclidean","maximum","manhattan",
"canberra", "binary","minkowski" to be passed to \code{\link[stats]{dist}}
function for calculating the distance for the clusters based on the
corr,corr1,corr0, tom, tom0, tom1 matrices}

\item{minimum_cluster_size}{The minimum cluster size. Only applicable if
\code{cutMethod='dynamic'}. This argument is passed to the
\code{\link[dynamicTreeCut]{cutreeDynamic}} function through the
\code{\link{u_cluster_similarity}} function. Default is 50.}

\item{...}{arguments passed to the \code{\link{u_cluster_similarity}}
function}
}
\value{
a list of length 8: \describe{\item{clustersAddon}{clustering results
  based on the environment and not the environment. see
  \code{\link{u_cluster_similarity}} for
  details}\item{clustersAll}{clustering results ignoring the environment. See
  \code{\link{u_cluster_similarity}} for details}\item{etrain}{vector of the
  exposure variable for the training
  set}\item{cluster_distance_similarity}{the similarity matrix based on the
  argument specified in
  \code{cluster_distance}}\item{eclust_distance_similarity}{the similarity
  matrix based on the argument specified in
  \code{eclust_distance}}\item{clustersAddonMembership}{a data.frame and
  data.table of the clustering membership for clustering results based on the
  environment and not the environment. As a result, each gene will show up
  twice in this table}\item{clustersAllMembership}{a data.frame and
  data.table of the clustering membership for clustering results based on all
  subjects i.e. ignoring the environment. Each gene will only show up once in
  this table}\item{clustersEclustMembership}{a data.frame and data.table of
  the clustering membership for clustering results accounting for the
  environment. Each gene will only show up once in this table}}
}
\description{
This is one of the functions for real data analysis, which will
  cluster the data based on the environment, as well as ignoring the
  environment
}
\details{
This function clusters the data. The results of this function should
  then be passed to the \code{\link{r_prepare_data}} function which output
  the appropriate X and Y matrices in the right format for regression
  packages such as \code{mgcv}, \code{caret} and \code{glmnet}
}
\examples{
data("tcgaov")
tcgaov[1:5,1:6, with = FALSE]
Y <- log(tcgaov[["OS"]])
E <- tcgaov[["E"]]
genes <- as.matrix(tcgaov[,-c("OS","rn","subtype","E","status"),with = FALSE])
trainIndex <- drop(caret::createDataPartition(Y, p = 0.5, list = FALSE, times = 1))
testIndex <- setdiff(seq_len(length(Y)),trainIndex)

\dontrun{
cluster_res <- r_cluster_data(data = genes,
                              response = Y,
                              exposure = E,
                              train_index = trainIndex,
                              test_index = testIndex,
                              cluster_distance = "tom",
                              eclust_distance = "difftom",
                              measure_distance = "euclidean",
                              clustMethod = "hclust",
                              cutMethod = "dynamic",
                              method = "average",
                              nPC = 1,
                              minimum_cluster_size = 60)

# the number of clusters determined by the similarity matrices specified
# in the cluster_distance and eclust_distance arguments. This will always be larger
# than cluster_res$clustersAll$nclusters which is based on the similarity matrix
# specified in the cluster_distance argument
cluster_res$clustersAddon$nclusters

# the number of clusters determined by the similarity matrices specified
# in the cluster_distance argument only
cluster_res$clustersAll$nclusters
}
}
\seealso{
\code{\link{u_cluster_similarity}}
}

