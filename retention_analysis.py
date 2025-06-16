# ============================================
# Retention Feature Correlation Analysis
# Tool: Python + pandas + seaborn
# Project: Feature Usage & Retention Strategy Dashboard
# Author: Linusha
# ============================================

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load dataset
df = pd.read_csv('Feature_Usage_Retention_Dataset.csv')

# Keep relevant numeric features
features = [
    'Feature_Adoption_Score',
    'Login_Frequency',
    'NPS_Rating',
    'Last_Interaction_Days',
    'Tenure_Months',
    'Retained'  # Binary target
]

df = df[features]

# -----------------------------
# Check for correlations
# -----------------------------

correlation_matrix = df.corr()

# Plot correlation heatmap
plt.figure(figsize=(8,6))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt=".2f")
plt.title('Correlation Matrix – Retention & Key Metrics')
plt.tight_layout()
plt.savefig('correlation_heatmap.png')
plt.show()


# -----------------------------
# Scatter for NPS vs Logins
# -----------------------------

sns.scatterplot(
    data=df,
    x='Login_Frequency',
    y='NPS_Rating',
    hue='Retained',
    palette='Set1'
)
plt.title('NPS vs Login Frequency by Retention')
plt.xlabel('Login Frequency')
plt.ylabel('NPS Rating')
plt.tight_layout()
plt.savefig('nps_vs_login_scatter.png')
plt.show()
