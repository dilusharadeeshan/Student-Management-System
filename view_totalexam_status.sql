CREATE VIEW vw_totalexam_status AS
SELECT 
    e.Reg_no,
    e.Course_code,
    ca.CA_Status,
    e.END_Status
FROM 
    vw_end_Status e
LEFT JOIN 
    vw_ca_status ca
ON 
    e.Reg_no = ca.Reg_no 
    AND e.Course_code = ca.Course_code;


   SELECT * FROM vw_totalexam_status; 