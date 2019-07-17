

inter_step_interval <- function(t){
  diff <- c(NA, t[2:length(t)] - t[1:(length(t)-1)] )
  return (diff)
}
