CREATE OR REPLACE PROCEDURE increment_rental_duration(
	proc_category_id category.category_id%TYPE,
	proc_num_dies NUMERIC)
LANGUAGE plpgsql
AS $increment_rental_dur$
BEGIN
    UPDATE film
    SET rental_duration = rental_duration + proc_num_dies
    WHERE film_id IN (
        SELECT f.film_id
        FROM film f
        INNER JOIN film_category fcat ON fcat.film_id = f.film_id
        INNER JOIN category cat ON cat.category_id = fcat.category_id
        WHERE cat.category_id = proc_category_id
    );
EXCEPTION
WHEN no_data_found then
	RAISE NOTICE ' No es pot trobat la categoria que es diu, torna a intentar';
WHEN others then
	RAISE NOTICE ' Error al actualitzar la taula!';
END;$increment_rental_dur$

DO $inc_exec$
BEGIN
CALL increment_rental_duration (4,4);
END; $inc_exec$
-- Comprovació
SELECT f.title, f.rental_duration ,c.category_id 
FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
WHERE c.category_id = 4
LIMIT 5;

-- Entrada: Id_Categoria,num_dies
-- Funcionament: 

