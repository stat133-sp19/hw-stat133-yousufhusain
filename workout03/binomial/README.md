**About the Binomial Package and Workout 3**

The binomial distribution is extremely significant in probability theory and statistics. It is widely used as a model to calculate probabilities about the number of successes in a number of identical trials.

The purpose of this package is to provide functions to be used when assessing the properties of the binomial distribution variable. 

**Functions**

*bin_choose()*

*bin_probability()*

*bin_distribution()*

*plot.bindis()*

*bin_cumulative()*

*plot.bincum()*

*bin_var()*

*print.binvar()*

*summary.binvar()*

*print.summary.binvar()*

*bin_mean()*

*bin_variance()*

*bin_mode()*

*bin_skewness()*

*bin_kurtosis()*

**Usage**

```{r}
bin_choose(n = 5, k = 2)

bin_probability(success = 5, trials = 10, prob = 0.25)

prob_distribution <- bin_distribution(trials = 10, prob = 0.25)
plot(prob_distribution)

cum_distribution <- bin_cumulative(trials = 10, prob = 0.25)
plot(cum_distribution)

list <- bin_variable (trials = 10, prob = 0.25)
list <- summary(list)

bin_mean(10, 0.25)
bin_variance(10, 0.25)
bin_mode(10, 0.25)
bin_skewness(10, 0.25)
bin_kurtosis(10, 0.25)
```



