SELECT p.name, p.id_card, p.birthdate, p.address, p.phone_number, 
       v.entry_date, v.exit_date, v.disease, v.treatment_cost,
       pr.medicine_name, pr.quantity, pr.unit_price,
       na.assistance_date, na.task
FROM Patient p
LEFT JOIN Visit v ON p.patient_id = v.patient_id
LEFT JOIN Prescription pr ON v.visit_id = pr.visit_id
LEFT JOIN Nurse_Assistance na ON v.visit_id = na.visit_id
WHERE p.patient_id = 1; -- Thay 1 bằng ID của bệnh nhân cần xem
