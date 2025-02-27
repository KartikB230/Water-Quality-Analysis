# Load required libraries
library(caret)
library(glmnet)
library(pROC)

# Assuming 'water_potability_1_' is your dataset

# Step 1: Data Preparation
# Replace missing values with appropriate imputation
water_potability_1_$ph[is.na(water_potability_1_$ph)] <- mean(water_potability_1_$ph, na.rm = TRUE)
water_potability_1_$Sulfate[is.na(water_potability_1_$Sulfate)] <- mean(water_potability_1_$Sulfate, na.rm = TRUE)

# Step 2: Split Data into Training and Testing Sets
set.seed(123)  # For reproducibility
train_index <- createDataPartition(water_potability_1_$Potability, p = 0.7, list = FALSE)
training_data <- water_potability_1_[train_index, ]
test_data <- water_potability_1_[-train_index, ]

# Step 3: Fit Logistic Regression Model
glm_model <- glm(Potability ~ ., data = training_data, family = binomial)

# Step 4: Make Predictions on Test Data
predicted_probs <- predict(glm_model, newdata = test_data, type = "response")

# Step 5: Evaluate Model
# Convert predicted probabilities to binary predictions (0 or 1)
predicted_classes <- ifelse(predicted_probs > 0.5, 1, 0)

# Confusion Matrix
conf_matrix <- confusionMatrix(factor(predicted_classes), factor(test_data$Potability))

# Extract evaluation metrics inside this block
# Accuracy
accuracy <- conf_matrix$overall["Accuracy"]

# Precision
precision <- conf_matrix$byClass["Pos Pred Value"]

# Recall (Sensitivity)
recall <- conf_matrix$byClass["Sensitivity"]

# F1-Score
f1_score <- conf_matrix$byClass["F1"]

# ROC Curve and AUC
roc_curve <- roc(response = test_data$Potability, predictor = predicted_probs)
auc_value <- auc(roc_curve)

# Step 6: Interpret Results
cat("Accuracy:", accuracy, "\n")
cat("Precision:", precision, "\n")
cat("Recall (Sensitivity):", recall, "\n")
cat("F1-Score:", f1_score, "\n")
cat("AUC:", auc_value, "\n")

plot(roc_curve)

