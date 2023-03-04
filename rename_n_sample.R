
if(!require(tidyverse)){
  install.packages("tidyverse")
}

data <- readr::read_csv("https://raw.githubusercontent.com/vlad-costin/qqm/main/qqm2023_labreport.csv") 

# candidate number as seed
RNGkind(sample.kind = "Rejection")
set.seed(cand_no)

# code to give students datasets with random variables names (all upper case, all lower case etc)
## function to transform dot separation to camel format
dot.to.camel <- function(x) {
  x <- sub('^(\\w?)', '\\U\\1', x, perl=T)
  x <- gsub('\\.(\\w?)', '\\U\\1',x, perl=T)
  return(x)
}

##create matrix of names
orig_names <- names(data)
UPPER_NAMES <- toupper(names(data))
dot.names <- gsub('\\_', '.', names(data))
UPPER.DOT.NAMES <- toupper(dot.names)
camelNames <- dot.to.camel(dot.names)
data_names <- cbind(orig_names, UPPER_NAMES, dot.names, UPPER.DOT.NAMES, camelNames)

##assign new names
names(data) <- data_names[,sample(ncol(data_names), 1)]


#random subset of rows - between 100 and 250 smaller than the whole dataset
data <- data[sample(c(1:nrow(data)), 
                    size = (nrow(data) - sample(100:250, 1))),]
data

# cand_no <- 123
# source("https://raw.githubusercontent.com/ra328research/qqm/main/rename_n_sample.R")
# data
