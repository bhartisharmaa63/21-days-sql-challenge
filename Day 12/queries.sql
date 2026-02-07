USE hospital;
## Practice Questions:
## 1. Find all weeks in services_weekly where no special event occurred.
SELECT week
FROM services_weekly
WHERE event IS NULL;

## 2. Count how many records have null or empty event values.
SELECT COUNT(*) AS no_special_event_records
FROM services_weekly
WHERE event IS NULL OR event = '';

## 3. List all services that had at least one week with a special event.
SELECT DISTINCT service
FROM services_weekly
WHERE event IS NOT NULL AND event <> '';


## Daily Challenge:
## Analyze the event impact by comparing weeks with events vs weeks without events. 
## Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, 
## and average staff morale. Order by average patient satisfaction descending.
SELECT event_status, COUNT(week) AS week_count,
Round(AVG(avg_patient_satisfaction),2) AS avg_patient_satisfaction,
Round(AVG(avg_staff_morale),2) AS avg_staff_morale
FROM (
SELECT week, Round(AVG(patient_satisfaction),2) AS avg_patient_satisfaction,
Round(AVG(staff_morale),2) AS avg_staff_morale,
CASE
WHEN COUNT(event) > 0 THEN 'With Event'
ELSE 'No Event'
END AS event_status
FROM services_weekly
GROUP BY week
) t
GROUP BY event_status
ORDER BY avg_patient_satisfaction DESC;
