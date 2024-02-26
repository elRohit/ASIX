CREATE FUNCTION f_calcularComissio(
    p_emp_salari numeric,
    p_percentatge numeric
) language plpgsql
AS $$
DECLARE
    v_percentatge numeric;
BEGIN
    v_percentatge := p_emp_salari * CASE WHEN salary <= 3000 THEN 0.15 / 100;
    RETURN v_percentatge;
END; $$





SELECT 