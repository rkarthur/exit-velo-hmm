##load required library
library(HiddenMarkov)

##one example, to start with:
##Carlos Gonzalez
test <- read.csv("CGonzalez_example.csv")

##initializing parameters:
##transition matrix and initial state
##sets transition probabilities at .5 each
Pi <- matrix(c(1/2, 1/2,
1/2, 1/2), byrow=TRUE, nrow=2)
##sets probability of "hot" state as .5
delta=c(.5,.5)

##run the model
##initializes the states as the 25th and 75th percentiles
mod <- dthmm(test$ExitVelo, Pi, delta, distn="norm",
list(mean=c(as.vector(quantile(test$diff, probs=.25)), 
as.vector(quantile(test$diff, probs=.75))), 
sd=c(10, 15)))

##plot the sequence of states
##with a LOESS trendline
scatter.smooth(Viterbi(mod))

