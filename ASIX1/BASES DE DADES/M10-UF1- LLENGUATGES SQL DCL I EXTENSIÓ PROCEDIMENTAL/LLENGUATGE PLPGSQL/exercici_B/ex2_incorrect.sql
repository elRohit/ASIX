--Fes un procediment emmagatzemat que rebi com a paràmetre d’entrada un codi d’actor i
-- mostri per consola la següent informació:
--Pel·lícules on ha participat: <numero_de_pel·lícules>

CREATE OR REPLACE PROCEDURE show_employee_info(
	p_actor_id IN numeric,
	v_salary OUT numeric
) language plpgsql 
AS $$

BEGIN
    --Consulta per obtenir el salari del empleat i guardar-lo en una variable
    SELECT salary INTO v_salary FROM employees WHERE employee_id = p_employee_id;

    -- PRINT SALARY
    RAISE NOTICE 'Salari: % ',v_salary;

    -- COMPARAR SALARI I PRINTAR MISSATGE SEGONS EL CAS 
    CASE
        WHEN v_salary = 0 THEN
            RAISE NOTICE 'Treballa gratis!';
        WHEN v_salary < 5000 THEN
            RAISE NOTICE 'És un becari.';
        WHEN v_salary < 10000 THEN
            RAISE NOTICE 'Està en la mitja.';
        ELSE
            RAISE NOTICE 'Cobra massa.';
    END CASE;
END; $$

-- Another Block or Script

DO $$
DECLARE
    sal numeric;
BEGIN
    CALL show_employee_info(110, sal);
    RAISE NOTICE '%', sal;
END;$$