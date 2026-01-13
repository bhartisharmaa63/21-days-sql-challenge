USE hospital;
### Practice Questions:
### 1. Count the total number of patients in the hospital.
SELECT COUNT(*) AS Total_Number_Of_Patients
FROM patients;
### 2. Calculate the average satisfaction score of all patients.
SELECT ROUND(AVG(satisfaction),2) AS Avg_Satisfaction_Score
FROM patients;
### 3. Find the minimum and maximum age of patients.
SELECT MIN(age) AS Min_Age, MAX(age) AS Max_Age
FROM patients;

### Daily Challenge:
### Calculate the total number of patients admitted, total patients refused, 
### and the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.
SELECT SUM(patients_admitted) AS Total_num_of_patients_admitted, SUM(patients_refused) AS total_patients_refused, 
ROUND(AVG(patient_satisfaction),2) AS avg_patient_satisfaction_score
FROM services_weekly;
