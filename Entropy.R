# Load required libraries
library(dplyr)

# Function to calculate entropy
calculate_entropy <- function(data) {
  # Count the frequency of unique values
  value_counts <- table(data)
  
  # Calculate probabilities
  probabilities <- value_counts / sum(value_counts)
  
  # Calculate entropy
  entropy <- -sum(probabilities * log2(probabilities))
  
  return(entropy)
}

# Iterate through columns and calculate entropy
entropies <- lapply(water_potability_1_, function(col) {
  if(is.numeric(col)) {
    calculate_entropy(col)
  } else {
    NA
  }
})

# Create a data frame to store results
entropy_df <- data.frame(Column = names(water_potability_1_), Entropy = unlist(entropies))

# Filter out columns with NA entropy (non-numeric columns)
entropy_df <- entropy_df[!is.na(entropy_df$Entropy), ]

# Display the entropy values for numeric columns
print(entropy_df)

