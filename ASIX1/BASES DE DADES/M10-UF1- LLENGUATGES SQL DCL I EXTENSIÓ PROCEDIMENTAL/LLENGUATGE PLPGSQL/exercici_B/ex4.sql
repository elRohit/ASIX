-- Crear una funció que rebi com a paràmetre un preu de lloguer i el cost de substitució i que retorni calculat el cost de substitució (amb dos decimals) en funció del preu de lloguer aplicant un factor de correcció segons s’indica a continuació:

-- Si el preu de lloguer és 0.99, el cost de substitució serà multiplicat per 1,1
-- Si el preu de lloguer és 2.99, el cost de substitució serà multiplicat per 1,25
-- Si el preu de lloguer és 4,99, el cost de substitució serà multiplicat per 1,3
-- En qualsevol altre cas el cost de substitució serà NULL.

--La funció només retornarà un valor en concret, però no modificarà res de la base de dades. Aquesta funció s'anomenarà f_calcularCost.  Utilitza un CASE per calcular el valor.
--Fes un SELECT de la taula film on utilitzis aquesta funció i mostris quin cost de substitució tindria cada pel·lícula en funció del preu de lloguer. Mostra el codi de pel·lícula, títol, preu del lloguer i el cost de substitució previst.

CREATE OR REPLACE FUNCTION f_CalcularCost(
    p_preu_lloguer IN film.rental_rate%TYPE,
    p_cost_subs IN film.replacement_cost%TYPE
) AS $func$
language plpgsql
DECLARE
    cost_total NUMERIC(5,2);
BEGIN
    cost_total := p_preu_lloguer + p_cost_subs;
    CASE
        WHEN p_preu_lloguer = 0.99 THEN cost_total := p_cost_subs * 1.1;
        WHEN p_preu_lloguer = 2.99 THEN cost_total := p_cost_subs * 1.25;
        WHEN p_preu_lloguer = 4.99 THEN cost_total := p_cost_subs * 1.3;
        ELSE cost_total := NULL;
    END CASE;

    RETURN cost_total;

END; $func$

-- DB Query
SELECT film_id, title, rental_rate, f_CalcularCost(rental_rate, replacement_cost) as cost_subs_previst;
