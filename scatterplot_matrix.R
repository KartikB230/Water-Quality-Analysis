# Assuming your dataset is named 'water_potability_1_'
# Create a scatterplot matrix
pairs(water_potability_1_[sapply(water_potability_1_, is.numeric)],
      main = "Scatterplot Matrix",
      pch = 19,   # Point character (shape)
      col = "blue"  # Point color
)

