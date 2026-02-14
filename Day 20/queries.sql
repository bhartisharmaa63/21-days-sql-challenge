USE hospital;
### Practice Questions:
### 1. Calculate running total of patients admitted by week for each service.
SELECT  week, service, patients_admitted, 
SUM(patients_admitted) OVER (PARTITION BY service ORDER BY week) AS running_tot
FROM services_weekly
GROUP BY week, service, patients_admitted;

### 2. Find the moving average of patient satisfaction over 4-week periods.
SELECT week, service, patient_satisfaction, 
round(avg(patient_satisfaction) 
OVER(PARTITION BY service ORDER BY week rows between 3 preceding and current row),2) AS moving_avg
FROM services_weekly
GROUP BY week, service, patient_satisfaction;

### 3. Show cumulative patient refusals by week across all services.
SELECT week, service, patients_refused, 
SUM(patients_refused) OVER (partition by service ORDER BY week) as cumulative_refusal
FROM services_weekly
GROUP BY week, service, patients_refused;

### Daily Challenge:
### Create a trend analysis showing for each service and week: week number, patients_admitted, 
### running total of patients admitted (cumulative), 3-week moving average of patient satisfaction 
### (current week and 2 prior weeks), and the difference between current week admissions and the 
### service average. Filter for weeks 10-20 only.
SELECT  week, service, patients_admitted, 
SUM(patients_admitted) OVER (PARTITION BY service ORDER BY week) AS cumulative_admissions, 
ROUND(AVG(patient_satisfaction) OVER (PARTITION BY service ORDER BY week ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2)
AS moving_avg_3_week, ROUND(patients_admitted- AVG(patients_admitted) OVER (PARTITION BY service), 2) AS diff_admission
FROM services_Weekly
WHERE week between 10 AND 20
ORDER BY week, service;
