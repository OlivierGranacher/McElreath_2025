
# RStan Diagnostic Script (copilot)

cat("=== RStan Diagnostic Script ===\n\n")

# 1. Check R version
cat("R version:\n")
print(R.version.string)
cat("\n")

# 2. Check if RTools is available
cat("Checking RTools availability:\n")
if (!requireNamespace("pkgbuild", quietly = TRUE)) {
  install.packages("pkgbuild")
}
library(pkgbuild)
pkgbuild::has_build_tools(debug = TRUE)
cat("\n")

# 3. Check installed package versions
cat("Installed package versions:\n")
packages <- c("rstan", "StanHeaders", "Rcpp", "inline")
for (pkg in packages) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    cat(pkg, "version:", as.character(packageVersion(pkg)), "\n")
  } else {
    cat(pkg, "is not installed.\n")
  }
}
cat("\n")

# 4. Check Makevars configuration
cat("~/.R/Makevars.win content (if exists):\n")
makevars_path <- file.path(Sys.getenv("HOME"), ".R", "Makevars.win")
if (file.exists(makevars_path)) {
  cat(readLines(makevars_path), sep = "\n")
} else {
  cat("Makevars.win file not found.\n")
}
cat("\n\n")

# 5. Try compiling a minimal Stan model
cat("Compiling a test Stan model:\n")
if (!requireNamespace("rstan", quietly = TRUE)) {
  install.packages("rstan", dependencies = TRUE)
}
library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

model_code <- "parameters {real y;} model {y ~ normal(0,1);}"
tryCatch({
  sm <- stan_model(model_code = model_code)
  cat("Stan model compiled successfully.\n")
}, error = function(e) {
  cat("Error during Stan model compilation:\n")
  cat(e$message, "\n")
})
