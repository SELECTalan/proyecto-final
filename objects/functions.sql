USE                      equipo_de_futbol_bastardmunchen;

-- Calcular la Duración de una Lesión en Días
DELIMITER $$
CREATE FUNCTION CalcularDuracionLesion(lesion_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE duracion INT;
    SELECT DATEDIFF(IFNULL(fecha_fin, CURDATE()), fecha_inicio) INTO duracion
    FROM Lesiones
    WHERE lesion_id = lesion_id;
    RETURN duracion;
END $$
DELIMITER ;

-- Obtener el Salario Total de un Equipo
DELIMITER $$

CREATE FUNCTION SalarioTotalEquipo(equipo_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(salario) INTO total
    FROM Jugadores
    WHERE equipo_id = equipo_id;
    RETURN total;
END $$
DELIMITER ;

SELECT SalarioTotalEquipo(1) AS SalarioTotal;

DELIMITER $$
