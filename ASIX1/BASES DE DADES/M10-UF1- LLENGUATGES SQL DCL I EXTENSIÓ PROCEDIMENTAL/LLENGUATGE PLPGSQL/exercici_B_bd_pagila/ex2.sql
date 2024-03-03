CREATE OR REPLACE PROCEDURE show_actor_info(
    p_actor_id IN actor.actor_id%TYPE
) LANGUAGE plpgsql 
AS $$
DECLARE
    v_num_movies numeric;
    v_actor_role varchar;
BEGIN
    -- Get the number of movies the actor has participated in
    SELECT COUNT(*) INTO v_num_movies FROM film_actor WHERE actor_id = p_actor_id;

    -- Print the number of movies
    RAISE NOTICE 'Pel·lícules on ha participat: %', v_num_movies;

    -- Determine the actor's role based on the number of movies
    CASE
        WHEN v_num_movies = 1 THEN
            v_actor_role := 'És un becari.';
        WHEN v_num_movies <= 3 THEN
            v_actor_role := 'És un actor de repartiment.';
        WHEN v_num_movies <= 5 THEN
            v_actor_role := 'És un secundari.';
        ELSE
            v_actor_role := 'El protagonista de la peli!';
    END CASE;

    -- Print the actor's role
    RAISE NOTICE '%', v_actor_role;
END; $$

-- Another Block or Script

DO $$
BEGIN
	CALL show_actor_info(120);
END;$$