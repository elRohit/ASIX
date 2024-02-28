-- Volem fer una taula d’auditoria per saber si un usuari ha fet alguna modificació sobre la taula DEPARTMENTS (ha afegit, eliminat o modificat alguna cosa). 
-- Fes un únic trigger per registrar el que es demana. ( El trigger només s’ha de disparar una vegada, encara que les operacions afectin a més d’una fila)

/*
--Creació de la taula
CREATE TABLE public.auditoria_departments (
    usuari VARCHAR(30), -- usuari que ha fet l'operacio
    data_hora TIMESTAMP, -- data i hora de l'operacio
    operacio CHAR(1) CHECK (operacio IN ('I', 'U', 'D')) -- I: insert, U: update, D: delete
);
*/

/*
--Creació del trigger
CREATE OR REPLACE TRIGGER auditoria_departments
AFTER INSERT OR UPDATE OR DELETE ON departments
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_departments (usuari, data_hora, operacio)
    VALUES (USER, CURRENT_TIMESTAMP, CASE
        WHEN INSERTING THEN 'I'
        WHEN UPDATING THEN 'U'
        WHEN DELETING THEN 'D'
    END);
END;
*/
--Creem la funció
CREATE OR REPLACE FUNCTION process_dept_audit()
RETURNS TRIGGER AS $dept_audit$
DECLARE
	accio_db char(1);
BEGIN 
	IF TG_OP = 'DELETE' THEN 
		accio_db := 'D';
	ELSIF TG_OP = 'INSERT' THEN 
		accio_db := 'I';
	ELSIF TG_OP = 'UPDATE' THEN
		accio_db := 'U';
	END IF;
	
	INSERT INTO public.auditoria_departments VALUES (user,current_timestamp,accio_db);
	RETURN NULL;
END; $dept_audit$ language plpgsql;

--Crear el Trigger 
CREATE OR REPLACE TRIGGER auditoria_departments
AFTER INSERT OR UPDATE OR DELETE ON departments
FOR EACH STATEMENT EXECUTE FUNCTION process_dept_audit();

--Disparar(Probar)
--Fes un INSERT UPDATE O DELETE.
INSERT INTO departments VALUES (12,'Fortnite',1700)
--Comprovació auditoria
select * from public.auditoria_departments;
