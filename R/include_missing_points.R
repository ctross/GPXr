#' This function is ....
#'
#' @param q A data-frame with GPS information from several tracks
#' @param L Inter-point interval. L=30 seconds, for example, assuming d$time is in units of seconds.
#' @return Blah

include_missing_points <- function(q,L){

q$mod <- q$time_interval %/% L # Calulate how many intervals of time occur between sequential GPS points. This uses modular arithmatic

q$mod[1] <- 1                  # Set first value to 1

q2 <- matrix(NA,nrow=sum(q$mod,na.rm=TRUE),ncol=ncol(q)) # Initalize a matrix big enough to hold observed data and missings
cs <- cumsum(q$mod)                                      # cs is how many actual data points, including missings, have occured by GPS observation i
q <- as.matrix(q)                                        # convert to matrix for next step to work


for( i in 1:length(cs)){                                 # Now map observed data at row i onto full matrix, using cs to give the real row of obsevration i
	q2[cs[i],] <- q[i,]
    }

colnames(q2) <- colnames(q)                              # Equalize coloumn names
q2 <- as.data.frame(q2)                                  # Convert back to data frame

q2$id <- rep(q2$id[1],length(q2$id))                     # Set track ID of missings to be the same as rest of track

q2$timestep <- 1:length(q2$id)                           # Now provide real time-step ID of GPS points, including missings
 
 return(q2)
}
