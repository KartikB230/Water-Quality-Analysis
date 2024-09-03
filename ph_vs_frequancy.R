# Assuming 'water_potability_1_' is your dataset
# Replace 'VariableName' with the name of the variable you want to create a histogram for

# Specify the variable name you want to plot
variable_name <- "ph"

# Create a histogram
hist(water_potability_1_[[variable_name]], 
     breaks = 20,  # Adjust the number of breaks (bins) as needed
     main = paste("Histogram of", variable_name),
     xlab = variable_name,
     ylab = "Frequency")
