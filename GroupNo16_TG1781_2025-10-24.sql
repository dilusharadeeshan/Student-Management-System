DROP PROCEDURE IF EXISTS get_attend_by_regno_and_coursecode_with_stype ;


DELIMITER //
CREATE PROCEDURE get_attend_by_regno_and_coursecode_with_stype(IN TG CHAR(20),IN cid CHAR(10))

BEGIN

SELECT * FROM attendance_percentage_with_medical_with_eligibility_with_name  WHERE Reg_no = TG AND 
course_code = cid;


END //

DELIMITER ;



CALL  get_attend_by_regno_and_coursecode_with_stype('TG/2023/001','ICT1253');









DROP PROCEDURE IF EXISTS get_attend_by_regno_and_coursecode_without_stype ;


DELIMITER //
CREATE PROCEDURE get_attend_by_regno_and_coursecode_without_stype(IN TG CHAR(20),IN cid CHAR(10))

BEGIN

SELECT * FROM attendance_percen_with_medical_with_elig_without_S_type_with_n  WHERE Reg_no = TG AND 
course_code = cid;


END //

DELIMITER ;



CALL get_attend_by_regno_and_coursecode_without_stype('TG/2023/001','ICT1253');