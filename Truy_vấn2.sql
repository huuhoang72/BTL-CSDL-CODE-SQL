-- Lương Bác sỹ
WITH DoctorSalaries AS (
  SELECT 
    d.doctor_id,
    COUNT(DISTINCT v.patient_id) * 1000000 AS bonus
  FROM Doctor d
  JOIN Visit v ON d.doctor_id = v.doctor_id
  WHERE MONTH(v.exit_date) = 10
  GROUP BY d.doctor_id
)
SELECT 
  d.name,
  7000000 + IFNULL(ds.bonus, 0) AS total_salary
FROM Doctor d
LEFT JOIN DoctorSalaries ds ON d.doctor_id = ds.doctor_id;

-- Lương Y tá
WITH NurseSalaries AS (
  SELECT 
    n.nurse_id,
    COUNT(na.visit_id) * 200000 AS bonus
  FROM Nurse n
  JOIN Nurse_Assistance na ON n.nurse_id = na.nurse_id
  WHERE MONTH(na.assistance_date) = 10
  GROUP BY n.nurse_id
)
SELECT 
  n.name,
  5000000 + IFNULL(ns.bonus, 0) AS total_salary
FROM Nurse n
LEFT JOIN NurseSalaries ns ON n.nurse_id = ns.nurse_id;
