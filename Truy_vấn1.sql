SELECT * FROM clinicmanagement.doctorWITH ConsecutiveVisits AS (
    SELECT 
        v.patient_id,
        v.disease,
        v.entry_date,
        v.exit_date,
        LAG(v.exit_date) OVER (PARTITION BY v.patient_id, v.disease ORDER BY v.entry_date) AS prev_exit
    FROM Visit v
    WHERE MONTH(v.entry_date) = 10 -- Thay '10' bằng tháng cụ thể cần kiểm tra
),
UniqueVisits AS (
    SELECT 
        patient_id,
        disease,
        entry_date,
        exit_date
    FROM ConsecutiveVisits
    WHERE prev_exit IS NULL OR DATEDIFF(entry_date, prev_exit) > 1 -- Chỉ tính các lần bệnh không liên tiếp
)
SELECT 
    disease,
    COUNT(DISTINCT patient_id) AS patient_count
FROM UniqueVisits
GROUP BY disease
ORDER BY patient_count DESC;
