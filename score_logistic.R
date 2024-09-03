# Load required libraries
library(caret)
library(glmnet)
library(pROC)  # Explicitly load pROC package

# Step 1: Data Preparation (Replace missing values with column means)


# Replace missing values with appropriate imputation for all numeric columns
numeric_cols <- sapply(water_potability_1_, is.numeric)
water_potability_1_[numeric_cols] <- lapply(water_potability_1_[numeric_cols], function(x) {
  ifelse(is.na(x), mean(x, na.rm = TRUE), x)
})

# Step 2: Split Data into Training and Testing Sets
set.seed(123)  # For reproducibility
train_index <- createDataPartition(water_potability_1_$Potability, p = 0.7, list = FALSE)
training_data <- water_potability_1_[train_index, ]
test_data <- water_potability_1_[-train_index, ]

# Step 3: Fit Logistic Regression Model
glm_model <- glm(Potability ~ ., data = training_data, family = binomial)



# Step 2: Apply the trained logistic regression model to new data
# Replace 'your_logistic_regression_model' with the actual model object
predicted_probs <- predict(glm_model, newdata = water_potability_1_, type = "response")

# Step 3: Optional - Threshold Selection
# If you need to classify the predictions, choose a threshold
threshold <- 0.5  # Example threshold; adjust as needed

# Convert predicted probabilities to binary predictions based on the threshold
predicted_classes <- ifelse(predicted_probs > threshold, 1, 0)

# Step 4: Scoring
# You can store the predicted probabilities or binary classifications in your dataset
water_potability_1_$Predicted_Probabilities <- predicted_probs
water_potability_1_$Predicted_Classes <- predicted_classes

# Display or export the scored data as needed
head(water_potability_1_)  # Display the first few rows of the scored data


