USE hospital;
### Practice Questions:
### 1. Show each patient with their service's average satisfaction as an additional column.
SELECT patient_id, name AS patient_name, service,
(SELECT ROUND(AVG(satisfaction),2)
FROM patients AS p1
WHERE p1.service = p.service) AS avg_service_satisfaction
FROM patients p;

### 2. Create a derived table of service statistics and query from it.
SELECT service, total_patients_admitted,
CASE WHEN total_patients_admitted > avg_patients_admitted_per_service THEN 'Above Average'
ELSE 'Below Average'
END AS performance
FROM (SELECT service, SUM(patients_admitted) AS total_patients_admitted,
(SELECT AVG(total)
FROM (SELECT SUM(patients_admitted) AS total
FROM services_weekly
GROUP BY service)  AS t) AS avg_patients_admitted_per_service
FROM services_weekly
GROUP BY service) AS service_stats;

### 3. Display staff with their service's total patient count as a calculated field.
SELECT staff_id, staff_name, role, service, 
(SELECT COUNT(patient_id)
FROM patients p 
WHERE p.service = s.service) AS total_patient_count
FROM staff s;

### Daily Challenge:
### Create a report showing each service with: service name, total patients admitted, 
### the difference between their total admissions and the average admissions across all services, 
### and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients 
### admitted descending.
SELECT service, tot_patients_admitted, ROUND(tot_patients_admitted - avg_patients_admitted,2) AS tot_avg_difference,
CASE 
WHEN tot_patients_admitted>avg_patients_admitted THEN 'Above Average'
WHEN tot_patients_admitted = avg_patients_admitted THEN 'Average'
ELSE 'Below Average'
END AS rank_indicator
FROM (SELECT service, SUM(patients_admitted) AS tot_patients_admitted,
(SELECT AVG(total) AS avg_admitted
FROM(SELECT SUM(patients_admitted) AS total
FROM services_weekly
GROUP BY service) AS tot_patients_per_service) AS avg_patients_admitted
FROM services_weekly
GROUP BY service) AS service_report
ORDER BY tot_patients_admitted DESC;

