Use hospital;
### Practice Questions:
### 1. Create a CTE to calculate service statistics, then query from it.
WITH services_stats AS (
SELECT service, COUNT(*) AS patient_count, AVG(satisfaction) AS avg_satisfaction
FROM patients
GROUP BY service
)
SELECT * FROM services_stats
WHERE avg_satisfaction > 80
ORDER BY patient_count DESC;

### 2. Use multiple CTEs to break down a complex query into logical steps.
WITH admission AS (
SELECT service, SUM(patients_admitted) AS tot_admitted, SUM(patients_refused) AS tot_refused
FROM services_weekly
GROUP BY service
) , satisfaction AS (
SELECT service, ROUND(AVG(satisfaction),2) AS avg_satisfaction, MIN(satisfaction) AS min_satisfaction,
MAX(satisfaction) AS max_satisfaction
FROM patients
GROUP BY service 
)
SELECT a.service, a.tot_admitted, a.tot_refused, s.avg_satisfaction, s.min_satisfaction, s.max_satisfaction
FROM admission a
JOIN satisfaction s
ON a.service = s.service
ORDER BY tot_admitted DESC;

### 3. Build a CTE for staff utilization and join it with patient data.
WITH staff_utilization AS (
SELECT service, COUNT(*) AS tot_staff, SUM(present) AS staff_present, 
ROUND(SUM(present) / COUNT(*)*100,2) AS utilization_percentage
FROM staff_schedule
GROUP BY service
)
SELECT p.patient_id, p.name AS patient_name, p.service, p.satisfaction, su.tot_staff, su.staff_present,
su.utilization_percentage
FROM patients p
JOIN staff_utilization su ON p.service = su.service
ORDER BY p.service, p.patient_id;

### Daily Challenge:
### Create a comprehensive hospital performance dashboard using CTEs. Calculate: 1) Service-level metrics 
### (total admissions, refusals, avg satisfaction), 2) Staff metrics per service (total staff, avg weeks present), 3) 
### Patient demographics per service (avg age, count). Then combine all three CTEs to create a final report showing service name, 
### all calculated metrics, and an overall performance score (weighted average of admission rate and satisfaction). 
### Order by performance score descending.
WITH service_metrics AS (
SELECT service, SUM(patients_admitted) AS tot_admissions,
SUM(patients_refused) AS tot_refusals,
AVG(patient_satisfaction) AS avg_satisfaction
FROM services_weekly
GROUP BY service
),
staff_metrics AS (
SELECT service, COUNT(*) AS tot_staff, 
(SELECT COUNT(DISTINCT week) FROM services_weekly) AS avg_weeks_present
FROM staff
GROUP BY service
),
patient_demographics AS ( 
SELECT service, COUNT(*) AS patient_count, 
AVG(age) AS avg_patient_age
FROM patients
GROUP BY service
)
SELECT sm.service, sm.tot_admissions, sm.tot_refusals, ROUND(sm.avg_satisfaction,1) AS avg_satisfaction,
stm.tot_staff, stm.avg_weeks_present, pd.patient_count, ROUND(pd.avg_patient_age,1) AS avg_patient_age,
ROUND (
((sm.tot_admissions*100.0/(sm.tot_admissions + sm.tot_refusals))*0.6)+ (sm.avg_satisfaction*0.4),
1) AS performance_score
FROM service_metrics sm
JOIN staff_metrics stm ON sm.service = stm.service
JOIN patient_demographics pd ON sm.service = pd.service
ORDER BY performance_score DESC;
