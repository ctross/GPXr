#' This function is a wrapper for thin_track, and thins a data.frame of GPS tracks to a given inter-point interval
#'
#' @param q A data-frame with GPS information from several tracks
#' @param L Inter-point interval. L=30 seconds, for example, assuming d$time is in units of seconds.
#' @return Thinned data-frame.

thin_track_multiple <- function(q,L){
	trips <- vector("list",max(q$id))

    for(j in 1:length(trips)){
      q2 <- q[which(q$id==j),]
      trips[[j]] <- thin_track(q2,L)
      }

    q3 <- do.call('rbind',trips)

    return(q3)
}
