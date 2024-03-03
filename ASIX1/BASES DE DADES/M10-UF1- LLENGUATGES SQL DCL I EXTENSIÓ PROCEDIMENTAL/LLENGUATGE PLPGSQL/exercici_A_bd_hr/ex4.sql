CREATE OR REPLACE FUNCTION f_calcularComissio(
    proc_salari IN employees.salary%TYPE
) RETURNS NUMERIC
language plpgsql 
AS $$ 
DECLARE
    proc_percentatge NUMERIC;
BEGIN 

    CASE 
        WHEN proc_salari <= 3000 THEN proc_percentatge := 0.15;
        WHEN proc_salari BETWEEN 3001 AND 7000 THEN proc_percentatge := 0.1 ;
        WHEN proc_salari BETWEEN 7001 AND 10000 THEN proc_percentatge := 0.05;
        WHEN proc_salari BETWEEN 10001 AND 20000 THEN proc_percentatge := 0.01;
        ELSE proc_percentatge := NULL;
    END CASE;
    
    RETURN proc_percentatge;
END;$$
-- DB Query
SELECT employee_id, first_name, salary, f_calcularComissio(salary) as comissio_prevista, salary * f_calcularComissio(salary) as COMISSIO_CALCULADA
FROM employees;
