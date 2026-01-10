#-- Practice Questions
#--- 1. Find all patients who are older than 60 years.
SELECT name AS Patient_name, age AS Age
FROM patients
WHERE age > 60;

#---2. Retrieve all staff members who work in the 'Emergency' service.
SELECT staff_id as Staff_ID, staff_name AS Staff_Name, service AS Service
FROM staff
WHERE service = 'Emergency';

#---3. List all weeks where more than 100 patients requested admission in any service.
SELECT week AS Week, month AS Month, service AS Service, patients_request AS More_than_100_admission_request
FROM services_weekly
WHERE patients_request > 100;

#-- Daily Challenge: 
#-- Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, 
#-- name, age, and satisfaction score.
SELECT patient_id AS Patient_ID, 
name AS Name,
age AS Age, 
satisfaction AS Satisfaction
FROM patients
WHERE satisfaction < 70 AND service = 'Surgery';
