-- Iniciar procediment
CREATE OR REPLACE PROCEDURE show_employee_info(
	proc_employee_id IN employees.employee_id%TYPE,
	var_salary OUT employees.salary%TYPE
) language plpgsql 
AS $$

BEGIN
    --Consulta per obtenir el salari del empleat i guardar-lo en una variable
    SELECT salary INTO var_salary FROM employees WHERE employee_id = proc_employee_id;

    -- PRINT SALARY DEL EMPLEAT PER PANTALLA (Hint: CALL )
    RAISE NOTICE 'Salari: % ',var_salary;

    -- COMPARAR SALARI I PRINTAR MISSATGE SEGONS EL CAS (== IF)
    IF var_salary BETWEEN MIN(employee_id) AND MAX(employee_id) THEN
        CASE
            WHEN var_salary = 0 THEN
                RAISE NOTICE 'Treballa gratis!';
            WHEN var_salary < 5000 THEN
                RAISE NOTICE 'És un becari.';
            WHEN var_salary < 10000 THEN
                RAISE NOTICE 'Està en la mitja.';
            ELSE
                RAISE NOTICE 'Cobra massa.';
        END CASE;
    ELSE
        RAISE NOTICE 'No existeix aquest empleat.';
    END IF;
END; $$



DO $$
DECLARE
    sal numeric;
BEGIN
    CALL show_employee_info(109800000, sal);
END;$$



