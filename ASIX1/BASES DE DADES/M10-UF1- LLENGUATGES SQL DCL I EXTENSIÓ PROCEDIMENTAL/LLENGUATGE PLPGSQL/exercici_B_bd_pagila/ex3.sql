CREATE OR REPLACE PROCEDURE increment_rental_duration(pcategory_id INT,pnum_dies INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE film
    SET rental_duration = rental_duration + pnum_dies
    WHERE film_id IN (
        SELECT f.film_id
        FROM film f
        INNER JOIN film_category fc ON fc.film_id = f.film_id
        INNER JOIN category c ON c.category_id = fc.category_id
        WHERE c.category_id = pcategory_id
    );
END;$$
DO $$
BEGIN
CALL increment_rental_duration (1,7);
END; $$
