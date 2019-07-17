

thin_tracks <- function(q,L){
	trips <- vector("list",max(q$id))

    for(j in 1:length(trips)){
      q2 <- q[which(q$id==j),]
      trips[[j]] <- thin_track(q2,L)
      }

    q3 <- do.call('rbind',trips)

    return(q3)
}
