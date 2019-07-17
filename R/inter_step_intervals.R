

inter_step_intervals <- function(q){

 for( i in 1:max(q$id)){  # For each track ID in the data-frame                
  q2 <- q[which(q$id==i),] # Pull out that track and save as a temporary object

  q2$d_time <- inter_step_interval(q2$time) # Apply inter_step_interval function to this track

  q[which(q$id==i),] <- q2 # Return result to main data-frame
  }

  return(q)

}
