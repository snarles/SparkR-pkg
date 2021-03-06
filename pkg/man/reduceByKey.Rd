\docType{methods}
\name{reduceByKey}
\alias{reduceByKey}
\alias{reduceByKey,RDD,ANY,integer-method}
\alias{reduceByKey,RDD,integer-method}
\title{Merge values by key}
\usage{
reduceByKey(rdd, combineFunc, numPartitions)

\S4method{reduceByKey}{RDD,ANY,integer}(rdd, combineFunc, numPartitions)
}
\arguments{
  \item{rdd}{The RDD to reduce by key. Should be an RDD
  where each element is list(K, V).}

  \item{combineFunc}{The associative reduce function to
  use.}

  \item{numPartitions}{Number of partitions to create.}
}
\value{
An RDD where each element is list(K, V') where V' is the
merged value
}
\description{
This function operates on RDDs where every element is of
the form list(K, V). and merges the values for each key
using an associative reduce function.
}
\examples{
\dontrun{
sc <- sparkR.init()
pairs <- list(c(1, 2), c(1.1, 3), c(1, 4))
rdd <- parallelize(sc, pairs)
parts <- reduceByKey(rdd, "+", 2L)
reduced <- collect(parts)
reduced[[1]] # Should be a list(1, 6)
}
}
\seealso{
groupByKey
}

