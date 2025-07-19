# Installing the rethinking package
install.packages(c("coda","mvtnorm","devtools","loo","dagitty","shape"))
# slim version without Stan - up to chapter 8
devtools::install_github("rmcelreath/rethinking@slim")
