USE hospital;
### Practice Questions:
### 1. Find services that have admitted more than 500 patients in total.
SELECT service AS Service, SUM(patients_admitted) AS Tot_patients_admitted
FROM services_weekly
GROUP BY service
HAVING Tot_patients_admitted > 500;
### 2. Show services where average patient satisfaction is below 75.
SELECT service AS Service, Round(AVG(patient_satisfaction),2) AS Avg_Satisfaction
FROM services_weekly
GROUP BY service
HAVING Avg_Satisfaction <75;
### 3. List weeks where total staff presence across all services was less than 50.
SELECT week, SUM(present) AS total_staff_present
FROM staff_schedule
GROUP BY week
HAVING SUM(present) < 50;

### Daily Challenge:
### Identify services that refused more than 100 patients in total and 
### had an average patient satisfaction below 80. Show service name, total refused, and average satisfaction.
SELECT service as Service, SUM(patients_refused) AS tot_patient_refused, 
Round(AVG(patient_satisfaction),2) AS Avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING tot_patient_refused> 100 AND Avg_patient_satisfaction < 80;
