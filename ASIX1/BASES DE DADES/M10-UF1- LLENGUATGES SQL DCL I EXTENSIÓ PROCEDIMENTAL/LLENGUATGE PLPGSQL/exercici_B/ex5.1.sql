CREATE OR REPLACE PROCEDURE get_pagila_employee_name(
    proc_client_id IN numeric,
    proc_client_first_name OUT VARCHAR(50)
)
language plpgsql
AS $proc$
BEGIN
    SELECT first_name INTO STRICT proc_client_first_name
    FROM customer
    WHERE customer_id = proc_client_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE NOTICE '  ';

END; $proc$

select max(customer_id) from customer;
-- Codi Execució (CALL PROC)
DO  $exe$
DECLARE 
fn VARCHAR(50);
begin 
CALL get_pagila_employee_name(600,fn);
RAISE NOTICE '%',fn;
END; $exe$

-- Entrada: Id_Categoria,num_dies
-- Funcionament: 

