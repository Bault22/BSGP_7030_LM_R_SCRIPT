#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop("Please provide exactly one argument: the path to the CSV file.")
}
    
file_path <- args[1]

data <- read.csv('regrex1.csv')

png(file = "R_ORIG.png")
plot(data$x, data$y)
title('Scatter Plot R')
dev.off()

lmData <- lm(y ~ x, data = data)

pred <- predict(lmData, data)

png(file = "R_LM.png")
plot(data$x, data$y)
lines(data$x, pred, col = "red")
title('Combined Plot R')
dev.off()

print(summary(lmData))