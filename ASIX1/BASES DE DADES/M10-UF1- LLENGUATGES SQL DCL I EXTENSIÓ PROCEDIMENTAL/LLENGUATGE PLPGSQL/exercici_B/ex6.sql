CREATE TABLE auditoria_emplsalari (
    usuari VARCHAR(30), -- usuari que ha fet l'operacio
    data_hora TIMESTAMP, -- data i hora de l'operacio
    film_id NUMERIC, -- id de la pel·lícula
    rental_rate_old NUMERIC, -- valor antic del rental_rate
    rental_rate_new NUMERIC, -- valor nou del rental_rate
    PRIMARY KEY (usuari, data_hora)
);

CREATE OR REPLACE FUNCTION auditoria_rental_rate()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO auditoria_emplsalari (usuari, data_hora, film_id, rental_rate_old, rental_rate_new)
    VALUES (CURRENT_USER, CURRENT_TIMESTAMP, NEW.film_id, OLD.rental_rate, NEW.rental_rate);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER auditoria_rental_rate
AFTER UPDATE OF rental_rate ON film
FOR EACH ROW
EXECUTE FUNCTION auditoria_rental_rate();
--QUERY
select film_id,title,rental_rate from film limit 1;
--UPDATE
update film
set rental_rate = rental_rate + 4
WHERE film_id = 1;

select * from public.auditoria_emplsalari