setwd(system.file("extdata/", package = "RHESSysIOinR"))


soildefs <- list.files("defs/", pattern = "soil_", full.names = TRUE)


read_soil_defs <- function(file){
  df<- read.table(file, sep = " ", header = FALSE, stringsAsFactors = FALSE)
  
  rownames(df) <- df[,2]
  df <- df[, -2]
  df <- df[-c(1,2),]
  return(df)
}


combined_df <- soildefs %>%
  lapply(read_soil_defs) %>%
  bind_rows()

print(combined_df)



# Load necessary library
library(dplyr)

# Function to read and process a single file
process_file <- function(file_path) {
  # Read the file without renaming columns
  data <- read.table(file_path, header = FALSE, sep = " ")
  
  # Extract values and variable names
  values <- data[[1]]
  variable_names <- data[[2]]
  
  # Create a named vector with variable names as names
  named_vector <- setNames(values, variable_names)
  
  # Convert named vector to a data frame
  data_frame <- as.data.frame(t(named_vector), stringsAsFactors = FALSE)
  
  return(data_frame)
}

# Get the list of files
file_list <- list.files(path = "defs/", pattern = "soil_", full.names = TRUE)

# Initialize an empty data frame to store results
result_df <- data.frame()

# Process each file
for (file in file_list) {
  temp_df <- process_file(file)
  
  # Extract the file name without "defs/" prefix and ".def" suffix
  file_name <- gsub("defs/|\\.def", "", file)
  
  # Set the row name to the file name
  rownames(temp_df) <- file_name
  
  # Bind the temp_df to the result_df
  result_df <- bind_rows(result_df, temp_df)
}

# Print the resulting table
print(result_df)


## create table of all soil map units in map

## pull ksat, m_z, pore size index, porosity, psi air entry, sand, silt, clay, soil_depth, take other values from nearest texture
plot(result_df$patch_default_ID,result_df$Ksat_0)

