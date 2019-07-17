#' GPXr: Process GPS data
#'
#' Documentatiion here is bare-bones, but will be updated as needed.
#'
#' @name GPXr
#' @docType package
NULL

#' @title Walking in Leipzig
#' @description GPS data from near MPI with simulated missing points.
#' @format A data frame with 10000 rows and 5 variables:
#' \describe{
#'   \item{\code{id}}{trip ID code, mandatory}
#'   \item{\code{time}}{Time ID code for each point, must be numeric and continous.}
#'   \item{\code{...}}{Lat, Long, and any other variables desired in the data frame}
#'}
#' @source Bad Elf PRo GPS unit
"LeipzigTour"
