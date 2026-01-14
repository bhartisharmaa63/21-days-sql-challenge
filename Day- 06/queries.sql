USE hospital;
### Practice Questions:
### 1. Count the number of patients by each service.
SELECT service AS Service, COUNT(patient_id) AS Count_of_patients
FROM patients
GROUP BY service;
### 2. Calculate the average age of patients grouped by service.
SELECT service AS Service, Round(AVG(age),2) AS Avg_Age
FROM patients
GROUP BY service;
### 3. Find the total number of staff members per role.
SELECT role AS Role, COUNT(staff_id) AS Tot_Staff
FROM staff
GROUP BY role;

### Daily Challenge:
### For each hospital service, calculate the total number of patients admitted, total patients refused, and the admission rate (percentage of requests that were admitted). 
### Order by admission rate descending.
SELECT service AS Service, SUM(patients_admitted) AS Tot_patients_admitted, SUM(patients_refused) AS Tot_patients_refused,
ROUND(SUM(patients_admitted)/SUM(patients_request)*100,2) AS Admission_rate
FROM services_weekly
GROUP BY service
ORDER BY Admission_Rate DESC;
