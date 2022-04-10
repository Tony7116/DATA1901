library(tidyverse);
library(readxl);
# ===============================================================
# CREATING THE TEXT LOOKUP TABLE
# ===============================================================
inscription_signum_lookup_table = data.frame(matrix(ncol = 1, nrow = 0))

inscription_signum_lookup_table_col_names = c("Signum")
colnames(inscription_signum_lookup_table) = inscription_signum_lookup_table_col_names

# ===============================================================
# READING MASTER DATA FILE
# ===============================================================

# Read in master spread sheet
master_dataset = read_excel("Project2/Data/Arch_master_spreadsheet.xls", sheet = "rundata", col_types = NULL, na = "")
master_signum = master_dataset$Signum
str(master_signum)

# Create a signum lookup table
master_signum_lookup_table = data.frame(matrix(ncol = 1, nrow = 0))
master_signum_lookup_col_names = c("Signum")
colnames(master_signum_lookup_table) = master_signum_lookup_col_names
# Testing for existance of master_lookup_table
print(master_signum_lookup_table)
str(master_signum_lookup_table)

# Bind the master signums into signum lookup table
master_signum_lookup_table = cbind(master_signum)
str(master_signum_lookup_table)

# ===============================================================
# READING SIGNUM OF INSCRIPTIONS DATA FILE
# ===============================================================
inscription_file = file(
    description = "Project2/Data/Arch_english_inscriptions.txt",
    open = "r",
    blocking = TRUE
);



repeat {
    single_line = readLines(inscription_file, n = 1);
    sig_num_match = str_match(single_line, "[^ ]* [^ ]* [^ ]*")
    inscription_signum_lookup_table = rbind(inscription_signum_lookup_table, sig_num_match)
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

print(inscription_signum_lookup_table)
str(inscription_signum_lookup_table)




