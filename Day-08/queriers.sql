USE hospital;
### Practice Questions:
### 1. Convert all patient names to uppercase.
SELECT UPPER(name) AS Patient_name
FROM patients;
### 2. Find the length of each staff member's name.
SELECT staff_name AS Staff_name, LENGTH(staff_name) AS Length_of_Staff_Name
FROM staff;
### 3. Concatenate staff_id and staff_name with a hyphen separator.
SELECT concat(staff_id, ' - ' , staff_name) AS Staff_name
FROM staff;
### Daily Challenge:
### Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, 
### age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. 
### Only show patients whose name length is greater than 10 characters.
SELECT patient_id AS Patient_ID, UPPER(name) AS Name, LOWER(service) AS Service, 
CASE
WHEN age>=65 THEN 'Senior'
WHEN age>=18 THEN 'Adult'
ELSE 'Minor'
END AS Age_category,
LENGTH(name) AS Length_of_name
FROM patients
WHERE LENGTH(name)> 10;
