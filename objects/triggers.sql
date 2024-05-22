USE                      equipo_de_futbol_bastardmunchen;

-- Cambiar el delimitador para evitar conflictos con los puntos y comas en el cuerpo del trigger
DELIMITER $$

-- Trigger para actualizar la fecha de inicio de una lesión
CREATE TRIGGER ActualizarFechaInicioLesion
BEFORE INSERT ON Lesiones
FOR EACH ROW
BEGIN
    DECLARE fecha_inicio_existente DATE;
    SELECT fecha_inicio INTO fecha_inicio_existente
    FROM Lesiones
    WHERE jugador_id = NEW.jugador_id
    ORDER BY fecha_inicio ASC
    LIMIT 1;

    IF fecha_inicio_existente IS NOT NULL AND NEW.fecha_inicio < fecha_inicio_existente THEN
        UPDATE Lesiones
        SET fecha_inicio = NEW.fecha_inicio
        WHERE jugador_id = NEW.jugador_id
        ORDER BY fecha_inicio ASC
        LIMIT 1;
    END IF;
END $$

-- Trigger para actualizar el salario total del equipo
CREATE TRIGGER ActualizarSalarioTotalEquipo
AFTER INSERT ON Contratos
FOR EACH ROW
BEGIN
    DECLARE total_salario DECIMAL(10, 2);
    SELECT SUM(salario) INTO total_salario
    FROM Jugadores
    WHERE equipo_id = NEW.equipo_id;
    
    UPDATE Equipos
    SET salario_total = total_salario
    WHERE equipo_id = NEW.equipo_id;
END $$

-- Volver al delimitador por defecto
DELIMITER ;

