#' This function is a wrapper for inter_step_interval, and calculates an inter-step interval for each track in a data.frame of GPS tracks
#'
#' @param q A data-frame with GPS information from several tracks
#' @return The original data frame with a new coulmn added.

inter_step_interval_multiple <- function(q){

	q$time_interval <- rep(NA,length(q[,1]))

 for( i in 1:max(q$id)){  # For each track ID in the data-frame                
  q2 <- q[which(q$id==i),] # Pull out that track and save as a temporary object

  q2$time_interval <- inter_step_interval(q2$time) # Apply inter_step_interval function to this track

  q[which(q$id==i),] <- q2 # Return result to main data-frame
  }

  return(q)

}

