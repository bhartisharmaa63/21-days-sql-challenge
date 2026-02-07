Use hospital;

### Practice Questions:
### 1. Show all staff members and their schedule information (including those with no schedule entries).
SELECT s.staff_id, s.staff_name, s.role, s.service, COUNT(ss.week) AS weeks_scheduled, COALESCE(SUM(ss.present), 0) AS weeks_present 
FROM staff s
LEFT JOIN staff_schedule ss on s.staff_id = ss.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service;
### 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
SELECT sw.service, COUNT(s.staff_id) AS number_of_staff_avail
FROM services_weekly sw
LEFT JOIN staff s on sw.service = s.service
GROUP BY sw.service;
###3. Display all patients and their service's weekly statistics (if available).
SELECT p.name AS patient_name, sw.week, COUNT(Distinct sw.service) AS total_services
FROM patients p
LEFT JOIN services_weekly sw ON p.service = sw.service
GROUP BY p.name, sw.week;

### Daily Challenge:
### Question: Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and the count of weeks 
### they were present (from staff_schedule). Include staff members even if they have no schedule records. Order by weeks present descending.
SELECT s.staff_id, s.staff_name, s.role, s.service,
COALESCE(SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END), 0) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss 
ON s.staff_id = ss.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service
ORDER BY weeks_present DESC;
