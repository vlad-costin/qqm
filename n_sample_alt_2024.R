
if(!require(tidyverse)){
  install.packages("tidyverse")
}

data <- readr::read_csv("https://raw.githubusercontent.com/vlad-costin/qqm/main/qqm2024_labreport.csv") 

# candidate number as seed
RNGkind(sample.kind = "Rejection")
set.seed(cand_no)


#random subset of rows - between 250 and 350 smaller than the whole dataset
data <- data[sample(c(1:nrow(data)), 
                    size = (nrow(data) - sample(250:350, 1))),]
data

# cand_no <- 123
# source("https://raw.githubusercontent.com/ra328research/qqm/main/rename_n_sample.R")
# data
