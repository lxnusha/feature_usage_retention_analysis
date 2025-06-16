-- ============================================
-- Simulated SQL Queries for Feature Usage & Retention Analysis
-- Project: Feature Usage & Retention Strategy Dashboard
-- Author: Linusha
-- ============================================


-- QUERY 1: Login Frequency Distribution by Retention

SELECT Retained, 
       AVG(Login_Frequency) AS Avg_Login_Frequency
FROM Feature_Usage_Retention_Dataset
GROUP BY c12;


-- QUERY 2: Feature Adoption by Retention

SELECT Retained,
       AVG(CASE WHEN Feature_A_Used = 'Yes' THEN 1 ELSE 0 END) AS Feature_A_Adoption,
       AVG(CASE WHEN Feature_B_Used = 'Yes' THEN 1 ELSE 0 END) AS Feature_B_Adoption,
       AVG(CASE WHEN Feature_C_Used = 'Yes' THEN 1 ELSE 0 END) AS Feature_C_Adoption
FROM Feature_Usage_Retention_Dataset
GROUP BY Retained;


-- QUERY 3: Retention by Subscription Plan

SELECT Subscription_Type,
       AVG(Retained) AS Retention_Rate
FROM Feature_Usage_Retention_Dataset
GROUP BY Subscription_Type;


-- QUERY 4: NPS vs Login Correlation

SELECT NPS_Rating, 
       AVG(Login_Frequency) AS Avg_Login
FROM Feature_Usage_Retention_Dataset
GROUP BY NPS_Rating;

-- QUERY 5: Churn by Tenure Buckets

SELECT Tenure_Binned, 
       AVG(Retained) AS Retention_Rate
FROM Feature_Usage_Retention_Dataset
GROUP BY Tenure_Binned;
