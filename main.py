import numpy as np
from sklearn.linear_model import LinearRegression

# Sample past monthly expenses
months = np.array([1,2,3,4,5,6]).reshape(-1,1)
expenses = np.array([2000, 2500, 2700, 3000, 3200, 3500])

# Train model
model = LinearRegression()
model.fit(months, expenses)

# Predict next month
next_month = np.array([[7]])
predicted_expense = model.predict(next_month)[0]

# User input
budget = float(input("Enter your monthly budget: "))
new_expense = float(input("Enter planned expense: "))

# Affordability check
total_future_expense = predicted_expense + new_expense

print("\nPredicted Expense:", round(predicted_expense,2))

if total_future_expense <= budget:
    print("Status: AFFORDABLE")
else:
    print("Status: NOT AFFORDABLE")
