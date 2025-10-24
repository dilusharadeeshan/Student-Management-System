CREATE VIEW vw_final_grade AS
SELECT 
    g.Reg_no,
    g.Course,
    g.Credit,
    g.CA_marks,
    g.End_marks,
    g.Final_marks,
    t.CA_Status,
    t.END_Status,
    CASE 
        WHEN t.CA_Status = 'CA_Fail' AND t.END_Status = 'END_Fail' THEN 'E(CA& ESA)'
        WHEN t.CA_Status = 'CA_Fail' THEN 'E(CA)'
        WHEN t.END_Status = 'END_Fail' THEN 'E(ESA)'
        ELSE g.Grade
    END AS Final_Grade,
    CASE 
        WHEN t.CA_Status = 'CA_Fail' OR t.END_Status = 'END_Fail' THEN 0.0
        ELSE g.Grade_Point
    END AS Final_Grade_Point
FROM 
    vw_individual_gradepoint g
LEFT JOIN 
    vw_totalexam_status t
ON 
    g.Reg_no = t.Reg_no 
    AND g.Course = t.Course_code;



SELECT * FROM vw_final_grade;