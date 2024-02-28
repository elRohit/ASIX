CREATE OR REPLACE PROCEDURE get_pagila_employee_name(
    proc_client_id IN numeric,
    proc_client_first_name OUT VARCHAR(50)
)
language plpgsql
AS $proc$
BEGIN
    SELECT first_name INTO proc_client_first_name
    FROM customer
    WHERE customer_id = proc_client_id;
END; $proc$


-- Codi Execució (CALL PROC)
DO  $exe$
DECLARE 
fn VARCHAR(50);
begin 
CALL get_pagila_employee_name(110,fn);
RAISE NOTICE '%',fn;
END; $exe$


--Codi de Eliminació del Prod
--DROP PROCEDURE get_pagila_employee_name;
