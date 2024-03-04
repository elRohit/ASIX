--Ex2
CREATE OR REPLACE PROCEDURE show_employee_info(
	p_employee_id IN numeric,
	v_salary OUT numeric
) language plpgsql 
AS $$

BEGIN
    SELECT salary INTO STRICT v_salary FROM employees WHERE employee_id = p_employee_id;
    RAISE NOTICE 'Salari: % ',v_salary;
    CASE
        WHEN v_salary = 0 THEN
            RAISE NOTICE 'Treballa gratis!';
        WHEN v_salary < 5000 THEN
            RAISE NOTICE 'És un becari.';
        WHEN v_salary < 10000 THEN
            RAISE NOTICE 'Està en la mitja.';
        ELSE
            RAISE NOTICE '11Cobra massa.';
    END CASE;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE NOTICE 'No es troba el empleat que demanes ';
END; $$

DO $$ 
DECLARE
sal numeric;
BEGIN 
	CALL show_employee_info(1200,sal);
END; $$

DROP PROCEDURE show_employee_info

SELECT MAX(employee_id) from employees;
