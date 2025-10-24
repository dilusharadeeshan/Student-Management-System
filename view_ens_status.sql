DROP VIEW IF EXISTS vw_end_Status;
CREATE VIEW vw_end_Status AS
SELECT 
    Reg_no,
    Course_code,
    end_marks,
    CASE 
        WHEN Course_code IN ('ICT1222', 'ICT1233', 'ICT1253', 'TMS1233') THEN 
            CASE WHEN end_marks >= 21 THEN 'END_Pass' ELSE 'END_Fail' END
        WHEN Course_code IN ('ENG1222', 'ICT1212', 'ICT1242', 'TCS1212') THEN 
            CASE WHEN end_marks >= 25 THEN 'END_Pass' ELSE 'END_Fail' END
        ELSE 'Unknown'
    END AS END_Status
FROM (

    SELECT 
        Reg_no,
        Course_code,
        `Total_end_marks(70%)` AS END_marks
    FROM vw_ENG1222_marks
    
    UNION ALL
    
    SELECT 
        Reg_no,
        Course_code,
        `Total_end_marks(70%)` AS END_marks
    FROM vw_ICT1212_marks
    
    UNION ALL
    
    SELECT 
        Reg_no,
        Course_code,
        `Total_end_marks(60%)` AS END_marks
    FROM vw_ICT1222_marks
    
    UNION ALL
    
    SELECT 
        Reg_no,
        Course_code,
        `Total_end_marks(60%)` AS END_marks
    FROM vw_ICT1233_marks
    
    UNION ALL
    
    SELECT 
        Reg_no,
        Course_code,
        `Total_end_marks(70%)` AS END_marks
    FROM vw_ICT1242_marks
    
    UNION ALL
    
    SELECT 
        Reg_no,
        Course_code,
        `Total_end_marks(60%)` AS END_marks
    FROM vw_ICT1253_marks
    
    UNION ALL
    
    SELECT 
        Reg_no,
        Course_code,
        `Total_end_marks(70%)` AS END_marks
    FROM vw_TCS1212_marks
    
    UNION ALL
    
    SELECT 
        Reg_no,
        Course_code,
        `Total_end_marks(60%)` AS END_marks
    FROM vw_TMS1233_marks
) AS all_END_marks
ORDER BY reg_no, course_code;



SELECT * FROM vw_end_Status;