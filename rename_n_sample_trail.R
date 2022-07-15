
if(!require(tidyverse)){
  install.packages("tidyverse")
}

url <- "https://raw.githubusercontent.com/vlad-costin/qqm/main/qqm2021_labreport_dataset.csv"
data <- read_csv(url) 


# candidate number as seed
RNGkind(sample.kind = "Rejection")
set.seed(cand_no_trail)

# function to transform dot separation to camel format
dot.to.camel <- function(x) {
  x <- sub('^(\\w?)', '\\U\\1', x, perl=T)
  x <- gsub('\\.(\\w?)', '\\U\\1',x, perl=T)
  return(x)
}

#create matrix of names
orig_names <- names(data)
UPPER_NAMES <- toupper(names(data))
dot.names <- gsub('\\_', '.', names(data))
UPPER.DOT.NAMES <- toupper(dot.names)
camelNames <- dot.to.camel(dot.names)
data_names <- cbind(orig_names, UPPER_NAMES, dot.names, UPPER.DOT.NAMES, camelNames)

#assign new names
names(data) <- data_names[,sample(ncol(data_names), 1)]


#random subset of rows - between 37 and 97 smaller than the whole dataset
data_trail <- data[sample(c(1:nrow(data)), 
                    size = (nrow(data) - sample(250:600, 1))),]
data_trail

# cand_no_trail <- 123
# source("https://raw.githubusercontent.com/ra328research/qqm/main/rename_n_sample_alt.R")
# data_alt
