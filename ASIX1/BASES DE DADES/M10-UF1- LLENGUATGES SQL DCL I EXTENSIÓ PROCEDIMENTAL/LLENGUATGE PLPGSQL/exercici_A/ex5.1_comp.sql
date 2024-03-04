 --Creació del Procediemnt
CREATE OR REPLACE PROCEDURE get_employee_name(
    proc_employee_id IN employees.employee_id%TYPE,
    proc_employee_first_name OUT employees.first_name%TYPE
) LANGUAGE plpgsql
AS $proc_emp_name$
BEGIN
    -- Query per guadar el nom a la variable
    SELECT first_name INTO proc_employee_first_name
    FROM employees
    WHERE employee_id = proc_employee_id;
    
    -- Si no se encuentra ningún registro, generar un error personalizado
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No se encontró ningún empleado con el ID: %', proc_employee_id;
    END IF;
    
    -- Print per pantalla el nom del emp a tarvés de emp_id
    RAISE NOTICE 'El nom és: %', proc_employee_first_name;

EXCEPTION 
	WHEN SQLSTATE 'P0001'
		THEN RAISE NOTICE ' ';
END; $proc_emp_name$

--Altre Bloc Anònim, crida al procediemnt per saber el nom a través del codi
DO  $execucio_emp_name$
DECLARE 
emp_fn VARCHAR(50);
BEGIN 
    CALL get_employee_name(210, emp_fn);
END; $execucio_emp_name$

--Comprovació
--SELECT first_name from employees where employee_id = 110;


-- Excepcions List: https://www.postgresql.org/docs/current/errcodes-appendix.html 

