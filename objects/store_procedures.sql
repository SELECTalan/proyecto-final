USE                      equipo_de_futbol_bastardmunchen;

DELIMITER $$

CREATE PROCEDURE ObtenerInformacionJugador(IN jugador_id INT)
BEGIN
    -- Variables para almacenar la información
    DECLARE jugador_nombre VARCHAR(100);
    DECLARE jugador_apellido VARCHAR(100);
    DECLARE jugador_posicion VARCHAR(50);
    DECLARE jugador_habilidades TEXT;
    DECLARE jugador_lesiones TEXT;
    DECLARE jugador_comentarios TEXT;

    -- Obtener información básica del jugador
    SELECT nombre, apellido, posicion INTO jugador_nombre, jugador_apellido, jugador_posicion
    FROM Jugadores
    WHERE jugador_id = jugador_id;

    -- Obtener habilidades del jugador
    SELECT GROUP_CONCAT(nombre SEPARATOR ', ') INTO jugador_habilidades
    FROM Habilidades
    WHERE habilidad_id IN (
        SELECT habilidad_id FROM HabilidadesJugadores WHERE jugador_id = jugador_id
    );

    -- Obtener lesiones actuales del jugador
    SELECT GROUP_CONCAT(tipo_lesion SEPARATOR ', ') INTO jugador_lesiones
    FROM Lesiones
    WHERE jugador_id = jugador_id AND (fecha_fin IS NULL OR fecha_fin > CURDATE());

    -- Obtener comentarios y observaciones sobre el jugador
    SELECT GROUP_CONCAT(descripcion SEPARATOR '; ') INTO jugador_comentarios
    FROM ComentariosObservaciones
    WHERE jugador_id = jugador_id;

    -- Mostrar la información obtenida
    SELECT 
        jugador_nombre AS 'Nombre',
        jugador_apellido AS 'Apellido',
        jugador_posicion AS 'Posición',
        jugador_habilidades AS 'Habilidades',
        IFNULL(jugador_lesiones, 'Ninguna') AS 'Lesiones Actuales',
        IFNULL(jugador_comentarios, 'Ninguno') AS 'Comentarios/Observaciones';
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE ActualizarSalarioJugador(IN jugador_id INT, IN nuevo_salario DECIMAL(10,2))
BEGIN
    -- Verificar si el jugador existe
    DECLARE jugador_existente INT;
    SELECT COUNT(*) INTO jugador_existente FROM Jugadores WHERE jugador_id = jugador_id;

    -- Si el jugador existe, actualizar su salario
    IF jugador_existente > 0 THEN
        UPDATE Jugadores SET salario = nuevo_salario WHERE jugador_id = jugador_id;
        SELECT CONCAT('Se actualizó el salario del jugador con ID ', jugador_id, ' a $', nuevo_salario) AS 'Mensaje';
    ELSE
        SELECT 'No se encontró ningún jugador con el ID especificado.' AS 'Error';
    END IF;
END$$

DELIMITER ;
