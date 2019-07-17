#' This function thins GPS tracks to a given inter-point interval
#'
#' @param q A data-frame with GPS information
#' @param L Inter-point interval. L=30 seconds, for example, assuming d$time is in units of seconds.
#' @return Thinned data-frame.

thin_track <- function(q,L){
	 q$keep <- rep(NA,length(q$id)) # Indicator for GPS points to keep
     q$keep[1] <- 1                 # Set first point to 1, keep

     i <- 1                         # Initalize i for a while loop

      while(i>0){                   # Iterate over data until condition cannot be met

	   i <- max(which(q$keep==1))   # Set i to be the maximum row index where we will keep the GPS point

	   cs <- cumsum(q$time_interval[(i+1):length(q$time_interval)]) # Calculate cumulative sum of time from current keep-point until end of track

	   # Now check if there is less remaining time in track than interval length L. If so, stop loop.
	    if(length(which(cs>L))==0){
		 i <-0
	    } else{
	   # Otherwise, continue loop, and set next value of keep, as the nearest GPS point that exceeds threshold L  	
        q$keep[i+min(which(cs>L))] <- 1
       }
    }

  q = q[which(q$keep==1),]
  q = q[, -which(colnames(q) %in% c("time_interval","keep"))]
  return (q)
}





