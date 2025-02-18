
if(!require(tidyverse)){
  install.packages("tidyverse")
}

data <- readr::read_csv("https://raw.githubusercontent.com/vlad-costin/qqm/main/qqm2025_labreport.csv") 

# candidate number as seed
RNGkind(sample.kind = "Rejection")
set.seed(cand_no)


#random subset of rows - between 100 and 250 smaller than the whole dataset
data <- data[sample(c(1:nrow(data)), 
                    size = (nrow(data) - sample(100:250, 1))),]
data

# cand_no <- 123
# source("https://raw.githubusercontent.com/ra328research/qqm/main/rename_n_sample.R")
# data
