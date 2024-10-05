SELECT SUM(v.treatment_cost) AS total_treatment_cost, 
       SUM(pr.quantity * pr.unit_price) AS total_medicine_cost, 
       (SUM(v.treatment_cost) + SUM(pr.quantity * pr.unit_price)) AS total_revenue
FROM Visit v
LEFT JOIN Prescription pr ON v.visit_id = pr.visit_id;
