USE hospital;
### Practice Questions:
### 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT patient_ID AS Patient_ID, name AS Patient_Name,
CASE 
WHEN satisfaction > 80 THEN 'High'
WHEN satisfaction BETWEEN 50 AND 80 THEN 'Medium'
ELSE 'LOW'
END AS Satisfaction_Category
FROM patients; 
### 2. Label staff roles as 'Medical' or 'Support' based on role type.
SELECT staff_id AS Staff_ID, staff_name AS Staff_name,
CASE
WHEN role IN ('doctor', 'nurse') THEN 'Medical'
ELSE 'Support'
END AS Role_category 
FROM staff;
### 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT patient_ID AS Patient_ID, name AS Patient_Name, age AS Age,
CASE
WHEN age >65 THEN '65+'
WHEN age BETWEEN 41 AND 65 THEN '41-65'
WHEN age BETWEEN 19 AND 40 THEN '19-40'
ELSE '0-18'
END AS Age_group
FROM patients;

### Daily Challenge:
### Create a service performance report showing service name, total patients admitted, 
### and a performance category based on the following: 'Excellent' if avg satisfaction >= 85, 
### 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by average satisfaction descending.
SELECT service AS Service, SUM(patients_admitted) AS Tot_patients_admitted, 
ROUND(AVG(patient_satisfaction),2) AS Avg_Satisfaction_score,
CASE
WHEN AVG(patient_satisfaction) >=85 THEN 'Excellent'
WHEN AVG(patient_satisfaction) >=75 THEN 'Good'
WHEN AVG(patient_satisfaction) >=65 THEN 'Fair'
ELSE 'Needs Improvement'
END AS Satisfaction_category
FROM services_weekly
GROUP BY service
ORDER BY AVG(patient_satisfaction) DESC;
