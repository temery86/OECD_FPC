#OECD_API.R

# install.packages("plumber")
# install.packages("readstata13")
library("foreign")
library(plumber)

#* Return the sum of two numbers
#* @param a Country [2 letter ISO]
#* @param b Number of children (0-4)
#* @param c Income of 1st Person (50, 100, 150)
#* @param d Income of 1st Person (0, 50, 100, 150, NA)
#* @param e Age of youngest child (Months: -12 to 324)
#* @param f Single (single = 1, couple = 2)
#* @get /oecdfpc

oecdfpc <- function(a, b, c, d, e, f) {
    file <- paste("C:/Users/TomE/Dropbox (NIDI)/GGP/SSHOC/OECD/OECD_", a, ".dta", sep = "")
    dat <- read.dta(file)
    oecdfpc <- dat[ which(dat$single==as.numeric(f)
                             & dat$kids==as.numeric(b)
                             & dat$inc1==as.numeric(c)
                             & dat$inc2==as.numeric(d)
                             & dat$time==as.numeric(e)), ]
    print(oecdfpc)
}
