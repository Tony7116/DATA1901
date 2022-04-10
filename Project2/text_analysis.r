library(readxl);
library(tidyverse);
library(stringr);
# ===============================================================
# CREATING THE TEXT LOOKUP TABLE
# ===============================================================
inscription_lookup_table = data.frame(matrix(ncol = 2, nrow = 0))
table_column_names = c("Signum", "text")
colnames(inscription_lookup_table) = table_column_names

print(inscription_lookup_table)
print("hello")

# ===============================================================
# READING INSCRIPTIONS DATA FILE
# ===============================================================
inscription_file = file(
    description = "Project2/Data/Arch_english_inscriptions.txt",
    open = "r",
    blocking = TRUE
);

repeat {
    single_line = readLines(inscription_file, n = 1);
    sig_num_match = str_match(single_line, "[^ ]* [^ ]* [^ ]*")
    result = "result: "
    string_print = paste(result, sig_num_match, sep = " ")
    print(string_print)
    if (identical(single_line, character(0))) {
        break;
    }
    print(single_line);

}

close(inscription_file);
rm(inscription_file);


