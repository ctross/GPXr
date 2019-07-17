#' Calculates an inter-step interval for each point on a given GPS tracks
#'
#' @param q A vector of time points from a gps file
#' @return A vector of time differences

inter_step_interval <- function(t){
  diff <- c(NA, t[2:length(t)] - t[1:(length(t)-1)] )
  return (diff)
}
