-- Accions a realitzar:
ALTER TABLE employees
ADD COLUMN num_dependents NUMERIC DEFAULT 0;

UPDATE employees e
SET num_dependents = (
    SELECT COUNT(*)
    FROM dependents d
    WHERE d.employee_id = e.employee_id
); --  Fi accions a realitzar

CREATE OR REPLACE TRIGGER update_num_dependents
AFTER INSERT OR UPDATE OR DELETE ON dependents
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        -- sumar 1 al num_dependents de l'empleat
        UPDATE employees
        SET num_dependents = num_dependents + 1
        WHERE employee_id = :NEW.employee_id;
    ELSIF UPDATING THEN
        -- Handle the case when employee_id is modified for a dependent
        -- (Assuming employee_id is a primary key in employees table)
        IF :OLD.employee_id <> :NEW.employee_id THEN
            -- Restar 1 al num_dependents de l'empleat antic
            UPDATE employees
            SET num_dependents = num_dependents - 1
            WHERE employee_id = :OLD.employee_id;
            -- Sumar 1 al num_dependents de l'empleat nou
            UPDATE employees
            SET num_dependents = num_dependents + 1
            WHERE employee_id = :NEW.employee_id;
        END IF;
    ELSIF DELETING THEN
        -- Si s'elimina un dependent, restar 1 al num_dependents de l'empleat antic
        UPDATE employees
        SET num_dependents = num_dependents - 1
        WHERE employee_id = :OLD.employee_id;
    END IF;
END;

