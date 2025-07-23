# Installing the rethinking package
install.packages(c("coda","mvtnorm","devtools","loo","dagitty","shape"))
# slim version without Stan - up to chapter 8
devtools::install_github("rmcelreath/rethinking")
# install.packages("remotes")
remotes::install_github("rmcelreath/rethinking")


#### Installing rstan
remove.packages("StanHeaders")
remove.packages("rstan")
install.packages("rstan", dependencies = TRUE)
library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())
#example(stan_model, package = "rstan", run.dontrun = TRUE)

