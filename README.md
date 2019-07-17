GPXr
========
This is an R package for processing GPX data file for statistical analysis

Install by running on R:
```{r}
library(devtools)
install_github("Ctross/GPXr")
```


A quick example:
```{r}
d <- read.csv("blah.csv") 
head(d) # d must include an ID variable, called d$id, and a time stamp d$time
```

Then, we can process like this:
```{r}
d2b <- inter_step_intervals(d2)
d3 <- thin_tracks(d2b,30)

d4 <- inter_step_intervals(d3)
d5<-include_missings_points_tracks(d4,30)
```
