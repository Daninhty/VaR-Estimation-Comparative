library(quantmod)
library(evd)     
library(extRemes)
library(moments)   

getSymbols("^GSPC", from = "2018-01-01", to = "2024-04-19", src = "yahoo", adjust = TRUE)
closeGSPC <- GSPC$GSPC.Close

GSPC.ret <- diff(log(closeGSPC))
GSPC.ret <- na.omit(GSPC.ret)

mean_ret <- mean(GSPC.ret)
var_ret  <- var(GSPC.ret)
skew_ret <- skewness(GSPC.ret)
kurt_ret <- kurtosis(GSPC.ret)

descriptive <- data.frame(
  Mean = mean_ret,
  Variance = var_ret,
  Skewness = skew_ret,
  Kurtosis = kurt_ret
)
descriptive

block_size <- 20
n_blocks <- floor(length(GSPC.ret) / block_size)
block_max <- sapply(1:n_blocks, function(i) {
  max(GSPC.ret[((i - 1) * block_size + 1):(i * block_size)])
})

gev_fit <- fgev(block_max)

alpha <- 0.95
gev_params <- gev_fit$estimate
xi  <- gev_params["shape"]
mu  <- gev_params["loc"]
beta <- gev_params["scale"]

VaR_GEV <- mu - (beta/xi) * (1 - (-log(1 - alpha))^(-xi))
VaR_GEV

threshold <- quantile(GSPC.ret, 0.95) 
exceedances <- GSPC.ret[GSPC.ret > threshold]

gpd_fit <- fevd(GSPC.ret, type = "GP", threshold = threshold, method = "MLE")
summary(gpd_fit)

xi_gpd <- gpd_fit$results$par["shape"]
beta_gpd <- gpd_fit$results$par["scale"]

n  <- length(GSPC.ret)
Nu <- length(exceedances)

VaR_GPD <- threshold + (beta_gpd/xi_gpd) * (((n/Nu * (1 - alpha))^(-xi_gpd)) - 1)
VaR_GPD

hasil <- data.frame(
  Method = c("GEV", "GPD"),
  VaR = c(VaR_GEV, VaR_GPD)
)
hasil
