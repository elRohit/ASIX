-- Fes un procediment emmagatzemat que rebi com a paràmetres un número de departament, 
--i un import i incrementi el salari de tots els empleats del departament indicat, amb el 
--salari que tenien més l’import indicat.

CREATE OR REPLACE PROCEDURE increment_salari(
    p_dept_id departments.department_id%TYPE,
    p_import employees.salary%TYPE
)
LANGUAGE plpgsql
AS $$
BEGIN
    if p_import is null then
		UPDATE employees
    	SET salary = NULL
    	WHERE department_id = p_dept_id;	
	else
		UPDATE employees
    	SET salary = salary + p_import
    	WHERE department_id = p_dept_id;
	end if;
	
	
	
EXCEPTION
	WHEN null_value_not_allowed
		THEN RAISE NOTICE 'No es permeten valors Nuls';
	WHEN no_data_found
		THEN RAISE NOTICE 'No es troba el que es demana';
END; $$

DO $$ 
BEGIN 
CALL increment_salari(104,null);
END; $$

update employees
set salary = 1
where salary IS NULL;
select * FROM EMPLOYEES where salary is null;