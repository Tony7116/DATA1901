library(tidyverse);
library(readxl);
# ===============================================================
# CREATING THE TEXT LOOKUP TABLE
# ===============================================================
inscription_lookup_table = data.frame(matrix(ncol = 3, nrow = 0))

inscription_lookup_table_col_names = c("Signum", "text", "tally")
colnames(inscription_lookup_table) = 
    inscription_lookup_table_col_names

print(inscription_lookup_table)
str(inscription_lookup_table)

# ===============================================================
# CREATING THE DATE LOOKUP TABLE
# ===============================================================
date_lookup_table = data.frame(matrix(ncol = 2, nrow = 0))
print(date_lookup_table)
str(date_lookup_table)

# ===============================================================
# CREATING THE INSCRIPTION TEXT-DATE LOOKUP TABLE
# ===============================================================
text_date_lookup_table = data.frame(matrix(ncol = 3, nrow = 0))
print(text_date_lookup_table)
str(text_date_lookup_table)

# ===============================================================
# CREATING THE Signum LOOKUP TABLE
# ===============================================================

# Create a signum lookup table
master_signum_lookup_table = data.frame(matrix(ncol = 1, nrow = 0))
master_signum_lookup_col_names = c("Signum")
colnames(master_signum_lookup_table) = master_signum_lookup_col_names
# Testing for existance of master_lookup_table
print(master_signum_lookup_table)
str(master_signum_lookup_table)

# ===============================================================
# READING MASTER DATA FILE
# ===============================================================

# Read in master spread sheet
master_dataset = read_excel(
    "Project2/Data/Arch_master_spreadsheet.xls",
    sheet = "rundata",
    col_types = NULL,
    na = ""
)

signum = master_dataset$Signum
str(signum)
dates = master_dataset$Stilgruppering
print(dates)
str(dates)


date_lookup_table = cbind("signum" = signum, "dates" = dates)
str(date_lookup_table)
date_lookup_table

# ===============================================================
# READING AND POPULATING SIGNUM OF INSCRIPTIONS TEXT FILE TO
# INSCRIPTION LOOKUP TABLE.
# ===============================================================
inscription_file = file(
    description = "Project2/Data/Arch_english_inscriptions.txt",
    open = "r",
    blocking = TRUE
);

bible_file = read.delim("Project2/Data/bible.txt", header = FALSE);
print(bible_file[2, 1])

repeat {
    # Reading each line of text in the inscription file
    single_line = readLines(inscription_file, n = 1)
    master_signum_lookup = master_signum_lookup_table[1, ]

    sig_num_match = str_match(single_line, "[^ ]* [^ ]* [^ ]*")
    print(sig_num_match)
    single_text_line = str_remove(single_line, "[^ ]* [^ ]* [^ ]* ")
    cleaned_single_text_line = 
        str_remove_all(single_text_line, "([.][.][.][ ])|([ ][.][.][.])")
    print(cleaned_single_text_line)

    split_text_line = str_split(cleaned_single_text_line, " ")
    split_text_line_vector = unlist(split_text_line)
    print(split_text_line)
    print(split_text_line_vector[1])

    count = 0
    for (i in 1:lengths(split_text_line)) {
        tolower(split_text_line)
        for (j in 1:2) {
            if (split_text_line_vector[i] == bible_file[j, 1]) {
                count = count + 1
            }
        }
    }

    print(count)

    inscription_lookup_table = 
        rbind(
            inscription_lookup_table,
            c(sig_num_match, cleaned_single_text_line, count))

    if (identical(single_line, character(0))) {
        break;
    }
}



close(inscription_file);
rm(inscription_file);

print(inscription_lookup_table)
str(inscription_lookup_table)
colnames(inscription_lookup_table) <- c("signum", "text", "tally")
str(inscription_lookup_table)

# ===============================================================
# REMOVING UNWANTED TEXT ROWS IN INSCRIPTION TABLE
# ===============================================================
inscription_lookup_table =
    inscription_lookup_table[!inscription_lookup_table$text == "", ]
inscription_lookup_table =
    inscription_lookup_table[!inscription_lookup_table$text == "°", ]

str(inscription_lookup_table)

# ===============================================================
# JOINING THE DATE LOOKUP TABLE WITH THE TEXT LOOKUP TABLE
# ===============================================================

text_date_lookup_table = merge(
    x = inscription_lookup_table,
    y = date_lookup_table,
    by = "signum"

)
print(text_date_lookup_table)
str(text_date_lookup_table)

text_date_lookup_table$tally = as.numeric(text_date_lookup_table$tally)
print(text_date_lookup_table$tally)

# Removing the rows which have 0 as their tally
text_date_lookup_table = subset(
    text_date_lookup_table,
    text_date_lookup_table$tally > 0
)

print(text_date_lookup_table)
str(text_date_lookup_table)
ggplot(text_date_lookup_table,
    aes(x = tally)
) + geom_bar()
