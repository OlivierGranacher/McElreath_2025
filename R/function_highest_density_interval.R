# Function de calcul de l'intervalle de plus haute  d'un vecteur (posterieur)
# 
highest_density_interval <- function(x, proportion = 0.1) {
  x <- sort(x)
  n <- length(x)
  stopifnot(n > 1)
  stopifnot(is.numeric(x))
  stopifnot(proportion < 1)
  stopifnot(proportion > 0)
  # Nombre de valeurs 
  k <- floor(n * proportion)
  dens_max <- 1e4
  if (k == 0) return(NA)
  for (i in 2:(n - k + 2)) {
    dens <- abs(- x[i-1] + x[i + k - 2 ] )
    if(dens <= dens_max) {
      dens_max <- dens
      borne_min <- x[i-1]
      borne_max <- x[i + k - 2]
    }
  }
  return(c(borne_min, borne_max))
}

# # Test 
# x <- rnorm(100)
# highest_density_interval(x, proportion = .5)
# x <-  c(1, 2, 3, 2, 1, 0) 
# highest_density_interval(x, proportion = 1/2)
