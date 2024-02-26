-- Fes un procediment emmagatzemat que rebi com a paràmetres un número de departament, 
--i un import i incrementi el salari de tots els empleats del departament indicat, amb el 
--salari que tenien més l’import indicat.

CREATE OR REPLACE PROCEDURE increment_salari(
    p_dept_id departments.department_id%TYPE,
    p_import employees.employee_id%TYPE
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE employees
    SET salary = salary + p_import
    WHERE department_id = p_dept_id;
END; $$