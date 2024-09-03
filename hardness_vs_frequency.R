# Assuming 'water_potability_1_' is your dataset

# Create a histogram for the "Hardness" variable
hist(water_potability_1_$Hardness,
     breaks = 20,  # Adjust the number of breaks (bins) as needed
     main = "Distribution of Hardness",
     xlab = "Hardness",
     ylab = "Frequency")

