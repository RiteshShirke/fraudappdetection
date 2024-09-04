# ml_model.py
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# Load dataset (features extracted from apps)
data = pd.read_csv("app_features.csv")  # CSV containing extracted features and labels

# Split the dataset
X = data.drop(columns=["label"])  # Features
y = data["label"]  # Labels (benign/malicious)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train a RandomForest Classifier
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Evaluate the model
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(f"Model Accuracy: {accuracy * 100:.2f}%")

# Save the model for later use in the mobile app
import joblib
joblib.dump(model, "fraud_detection_model.pkl")
