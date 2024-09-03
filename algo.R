# Change the display format to suppress scientific notation
options(scipen = 999)

# Fit the linear regression model
lm_model <- lm(Potability ~ ph + Hardness + Solids + Chloramines + Sulfate + Conductivity + Organic_carbon + Trihalomethanes + Turbidity, data = water_potability_1_)

# Print the summary of the model
summary(lm_model)


# Assuming you have already fitted the linear regression model 'lm_model'

# Remove rows with missing values in 'ph' and 'Sulfate' columns
water_potability_1_<- na.omit(water_potability_1_)


# Predict using the model
predicted <- predict(lm_model, newdata = water_potability_1_)

# Extract the actual values from your data frame
actual <- water_potability_1_$Potability

# Calculate RMSE
rmse <- sqrt(mean((predicted - actual)^2))
cat("RMSE:", rmse, "\n")
 

