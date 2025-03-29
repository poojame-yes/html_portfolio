Select * from practice_assignment;


ALTER TABLE practice_assignment 
ALTER COLUMN medical_expenses TYPE NUMERIC;

ALTER TABLE practice_assignment DROP CONSTRAINT practice_assignment_pkey;

-- Assignment Question and answers
--- 1) total numbers of patients

SELECT COUNT(*) AS total_patients FROM practice_assignment;

---2) average number of doctor per hospital

SELECT AVG(doctors_count) AS avg_number_doctors
FROM practice_assignment;

--- 3) top 3 departments with the highest number of petients
Select department,patients_count
FROM practice_assignment 
ORDER BY patients_count DESC LIMIT 3;

---4)hospital with the maximum medical expenses
SELECT hospital_name, SUM(Medical_Expenses) AS total_expenses
FROM practice_assignment
GROUP BY Hospital_Name
ORDER BY total_expenses
DESC LIMIT 1;

---5) daily average medical expenses
SELECT AVG(Medical_Expenses) AS avg_medical_expenses
FROM practice_assignment;

6)--- longest hospital stay by calculating the diffrence between discharge date and admission date
SELECT hospital_name,  Admission_Date - Discharge_Date AS stay_duration
FROM practice_assignment
ORDER BY stay_duration
LIMIT 1;

7)--- count the total number of patients treated in each city
SELECT location, COUNT(*) AS total_patients
FROM practice_assignment
GROUP BY location
ORDER BY total_patients DESC;


8)---calculate the average number of days patients spend in each department

SELECT department, AVG(discharge_date - admission_date) AS day_spent
FROM practice_assignment
GROUP BY department
ORDER BY day_spent DESC;

9)--- find the department with the least number of patient
SELECT department, COUNT(*) AS patient_count
FROM practice_assignment
GROUP BY department
ORDER BY patient_count ASC LIMIT 1;

10)--- group the data by month and calculate the total medicle expenses for each month


SELECT 
    DATE_TRUNC('month', admission_date) AS month,  
    SUM(medical_expenses) AS total_expenses  
FROM practice_assignment  
GROUP BY month  
ORDER BY month;






)


