USE hospital;
### Practice Questions:
### 1. Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT  p.name AS patient_name, p.service, s.staff_name, ss.week, ss.present AS Staff_present
FROM patients p
LEFT JOIN staff s
ON p.service = s.service
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id;
### 2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT  sw.week, sw.service, COUNT(DISTINCT s.staff_id) AS staff_assigned,
SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) AS staff_present
FROM services_weekly sw
LEFT JOIN staff s
ON sw.service = s.service
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
GROUP BY sw.week, sw.service
ORDER BY sw.week, sw.service;
### 3. Create a multi-table report showing patient admissions with staff information.
SELECT p.patient_id, p.name AS patient_name, p.service, s.staff_name, s.role, ss.week, ss.present
FROM patients p
LEFT JOIN staff s
ON p.service = s.service
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
ORDER BY p.name, ss.week;

### Daily Challenge:
### Create a comprehensive service analysis report for week 20 showing: service name, 
### total patients admitted that week, total patients refused, average patient satisfaction, 
### count of staff assigned to service, and count of staff present that week. Order by patients admitted descending.
SELECT sw.service AS service_name,
SUM(sw.patients_admitted) AS total_patients_admitted,
SUM(sw.patients_refused) AS total_patients_refused,
AVG(sw.patient_satisfaction) AS avg_patient_satisfaction,
COUNT(DISTINCT s.staff_id) AS staff_assigned,
SUM(CASE 
WHEN ss.present = 1 THEN 1 ELSE 0 END) AS staff_present
FROM services_weekly sw
LEFT JOIN staff s
ON sw.service = s.service
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
AND ss.week = sw.week
WHERE sw.week = 20
GROUP BY sw.service
ORDER BY total_patients_admitted DESC;
