# Load required libraries
library(gplots)

# Calculate the correlation matrix for numeric columns in your data
correlation_matrix <- cor(water_potability_1_[sapply(water_potability_1_, is.numeric)])

# Create the correlation heatmap
heatmap.2(correlation_matrix,
          trace = "none",      # Remove row and column labels
          density.info = "none", # Remove density plot
          margins = c(10, 10),  # Add extra space for row and column labels
          col = colorRampPalette(c("blue", "white", "red"))(100), # Color scheme
          main = "Correlation Heatmap",
          key.title = NA,       # Remove color key title
          symm = TRUE           # Show only the lower triangular part for symmetric matrix
)

