library("tidyverse")
# This function imports a csv file and returns the structure
# and dimentions of the dataset.
import_data <- function(data_set) {
    read.csv(data_set)
    dim(data_set)
}