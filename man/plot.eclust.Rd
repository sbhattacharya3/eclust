% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_functions.R
\name{plot.eclust}
\alias{plot.eclust}
\title{Plot Heatmap of Cluster Summaries by Exposure Status}
\usage{
\method{plot}{eclust}(x, type = c("ECLUST", "CLUST"), summary = c("pc",
  "avg"), sample = c("training", "test"), unexposed_title = "E=0",
  exposed_title = "E=1", ...)
}
\arguments{
\item{x}{object of class \code{eclust}, which is returned by the
\code{\link{r_cluster_data}} function}

\item{type}{show results from the "ECLUST" (which considers the environment)
or "CLUST" (which ignores the environment) methods. Default is "ECLUST".
See \code{\link{r_cluster_data}} for details. This function uses the
\code{clustersAddon} object for "ECLUST" and the \code{clustersAll} for
"CLUST"}

\item{summary}{show the 1st principal component or the average of each
cluster. Default is "pc".}

\item{sample}{which sample to show, the "training" or the "test" set. Default
is "training". This is determined by the \code{train_index} and
\code{test_index} arguments in the \code{\link{r_cluster_data}} function.
If you want to show all subjects, then provide the numeric vector 1:n to
either argument, where n is the entire sample size.}

\item{unexposed_title}{The title for the unexposed subjects heatmap. Default
is "E=0".}

\item{exposed_title}{The title for the exposed subjects heatmap. Default is
"E=1".}

\item{...}{other arguments passed to the
\code{\link[ComplexHeatmap]{Heatmap}} function}
}
\value{
a plot of two Heatmaps, side-by-side, of the cluster summaries by exposure status
}
\description{
Plots cluster summaries such as the 1st principal component or
  average by exposure status. This is a plot method for object of class
  eclust returned by the \code{\link{r_cluster_data}} function. Two heatmaps,
  side-by-side are returned, where the first heatmap corresponds to the
  unexposed subjects and the second heatmap corresponds to the exposed
  subjects.
}
\details{
Rows are the cluster summaries and columns are the subjects. This
  function determines the minimum and maximum value for the whole dataset and
  then creates a color scale using those values with the
  \code{\link[circlize]{colorRamp2}}. This is so that both heatmaps are on
  the same color scale, i.e., each color represents the same value in both
  heatmaps. This is done for being able to visually compare the results.
}
\examples{
\dontrun{
data("tcgaov")
tcgaov[1:5,1:6, with = FALSE]
Y <- log(tcgaov[["OS"]])
E <- tcgaov[["E"]]
genes <- as.matrix(tcgaov[,-c("OS","rn","subtype","E","status"),with = FALSE])
trainIndex <- drop(caret::createDataPartition(Y, p = 1, list = FALSE, times = 1))
testIndex <- setdiff(seq_len(length(Y)),trainIndex)

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

class(cluster_res)

plot(cluster_res, show_column_names = FALSE)
}
}

