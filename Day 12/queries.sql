USE hospital;

### Practice Questions:
### 1. Extract the year from all patient arrival dates.
SELECT patient_id AS Patient_ID, name AS Patient_Name,
YEAR(arrival_date) as Year_of_arrival
FROM patients;
### 2. Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT patient_id AS Patient_ID, name AS Patient_Name,
DATEDIFF(departure_date, arrival_date) AS Length_of_Stay
FROM patients;
### 3. Find all patients who arrived in a specific month (JAN)
SELECT patient_id AS Patient_ID, 
name AS Patient_Name,
MONTH(arrival_date) AS Month_of_Arrival
FROM patients
WHERE MONTH(arrival_date) = 1;


### Daily Challenge:
### Calculate the average length of stay (in days) for each service, 
### showing only services where the average stay is more than 7 days. 
### Also show the count of patients and order by average stay descending.
SELECT service as Service, ROUND(AVG(DATEDIFF(departure_date, arrival_date)),2) AS Avg_length_of_Stay_in_days, 
COUNT(patient_id) AS Count_of_Patients
FROM patients
GROUP BY service
HAVING Avg_length_of_Stay_in_days > 7
ORDER BY Avg_length_of_Stay_in_days DESC;
