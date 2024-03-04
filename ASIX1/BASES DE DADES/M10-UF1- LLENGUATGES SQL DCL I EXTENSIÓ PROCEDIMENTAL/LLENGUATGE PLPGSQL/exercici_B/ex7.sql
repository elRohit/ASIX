--Abans de tot exec. aquestes querys:

alter table film 
add column stock numeric default 0;

update film f
set stock = (select count(*) 
                     from inventory i 
                     where i.film_id = f.film_id);
					 
--Activitat 7
--Crear un trigger que mantingui actualitzat el camp stock de la taula film automàticament  en cas de inserir, modificar o eliminar una còpia (inventory).
--Heu de tenir en compte que:
--●	Si inserim una nova còpia (inventory_id) s’ha de sumar a la columna stock.
--●	Si eliminen una còpia existent (inventory_id) ha de restar de la columna stock.
--●	Si modifiquem el camp film_id d’una còpia ... (pensa-ho).


CREATE OR REPLACE FUNCTION update_stock()
RETURNS TRIGGER 
LANGUAGE plpgsql AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE film
        SET stock = stock + 1
        WHERE film_id = NEW.film_id;
        
    ELSIF TG_OP = 'DELETE' THEN
        UPDATE film
        SET stock = stock - 1
        WHERE film_id = OLD.film_id;
        
    ELSIF TG_OP = 'UPDATE' THEN
        IF OLD.film_id <> NEW.film_id THEN
            UPDATE film
            SET stock = stock - 1
            WHERE film_id = OLD.film_id;
            UPDATE film
            SET stock = stock + 1
            WHERE film_id = NEW.film_id;
        END IF;
    END IF;
    RETURN NULL;
END;
$$ 

CREATE TRIGGER update_stock_trigger
AFTER INSERT OR DELETE OR UPDATE
ON inventory
FOR EACH ROW
EXECUTE FUNCTION update_stock();
--Comprovacions:
select FILM_ID,title,stock from film limit 1;
insert into inventory VALUES (4582,1,1,current_timestamp);
