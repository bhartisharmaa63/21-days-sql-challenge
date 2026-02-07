Use hospital;

### Practice Questions:
### 1. Join patients and staff based on their common service field (show patient and staff who work in same service).
SELECT p.patient_id, p.name AS Patient_Name,
p.service, s.staff_name, s.role, s.staff_id
FROM patients P
INNER JOIN staff s on p.service = s.service;
### 2. Join services_weekly with staff to show weekly service data with staff information.
SELECT sw.week, sw.month, sw.service, sw.staff_morale, sw.event, s.staff_name, s.role, s.staff_id
FROM services_weekly sw
INNER JOIN staff s on sw.service = s.service;
### 3. Create a report showing patient information along with staff assigned to their service.
SELECT p.patient_id, p.name AS patient_name,
p.service, s.staff_name
FROM patients p
LEFT JOIN staff s on p.service = s.service;

### Daily Challenge:
### Create a comprehensive report showing patient_id, patient name, age, service, and the total 
### number of staff members available in their service. Only include patients from services that 
SELECT p.patient_id, p.name as patient_name, p.age, p.service, s.total_avail_staff
FROM patients p
INNER JOIN (Select service, COUNT(staff_id) AS total_avail_staff
FROM staff
GROUP BY service
HAVING COUNT(staff_id) > 5) s on p.service = s.service
ORDER BY total_avail_staff DESC, Patient_name;
