#' This function is ....
#'
#' @param q A data-frame with GPS information from several tracks
#' @param L Inter-point interval. L=30 seconds, for example, assuming d$time is in units of seconds.
#' @return Blah



include_missing_points_multiple <- function(q,L){

trips <- vector("list",max(q$id))

for(j in 1:length(trips)){
 q2 <- q[which(q$id==j),]
 trips[[j]] <- include_missings_points(q2,L)
}

    q3 = do.call('rbind',trips)

    q3 = q3[, -which(colnames(q3) %in% c("time_interval","mod"))]

    return(q3)
}
