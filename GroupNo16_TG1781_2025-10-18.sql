DELIMITER //
CREATE PROCEDURE Finalmarks (IN TG CHAR(20), IN C_code VARCHAR(20), OUT Result DECIMAL(5,2))

BEGIN

DECLARE q1 DECIMAL(5,2);
DECLARE q2 DECIMAL(5,2);
DECLARE q3 DECIMAL(5,2);
DECLARE ass DECIMAL(5,2);
DECLARE M_theory DECIMAL(5,2);
DECLARE M_practical DECIMAL(5,2);
DECLARE E_theory DECIMAL(5,2);
DECLARE E_practical DECIMAL(5,2);

DECLARE Tquiz DECIMAL(5,2);
DECLARE Tass DECIMAL(5,2);
DECLARE Tmid DECIMAL(5,2);
DECLARE Tend DECIMAL(5,2);

SELECT Quiz_1,Quiz_2,Quiz_3 INTO q1,q2,q3 FROM mark WHERE Reg_no = TG AND Course_code =C_code;
SET Tquiz = ((q1+q2+q3) - LEAST(q1,q2,q3)) * 0.05;

SELECT Assesment INTO ass  FROM mark WHERE Reg_no = TG AND Course_code =C_code;
 SET Tass = ass*0.1;


SELECT Mid_theory,Mid_practical INTO M_theory,M_practical  FROM mark WHERE Reg_no = TG AND Course_code =C_code;

IF(M_theory IS NOT NULL AND M_practical IS NOT NULL) THEN 
    SET Tmid =(M_theory * 0.1) + (M_practical *0.1); 

ELSEIF (M_theory IS NULL) THEN
    SET Tmid = M_practical * 0.2;

ELSEIF (M_practical IS NULL) THEN
    SET Tmid = M_theory * 0.2;
ELSE
        SET Tmid = 0;

END IF;



SELECT End_theory,End_practical INTO E_theory,E_practical  FROM mark WHERE Reg_no = TG AND Course_code =C_code;

IF(E_theory IS NOT NULL AND E_practical IS NOT NULL) THEN 
    SET Tend =(E_theory * 0.3) + (E_practical * 0.3); 

ELSEIF (E_theory IS NULL) THEN
   SET Tend = E_practical * 0.6;

ELSEIF (E_practical IS NULL) THEN
   SET Tend = E_theory * 0.6;
ELSE
        SET Tend = 0;

END IF;


 SET Result = Tquiz + Tass + Tmid +Tend ;

 SELECT Result AS FINAL_MARKS;


END //

DELIMITER ;










CALL Finalmarks("TG/2023/001","TMS1233",@Result);



DROP PROCEDURE Finalmarks;
SELECT @Result AS FINAL_RESULT;