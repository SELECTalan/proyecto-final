DROP DATABASE IF EXISTS  equipo_de_futbol_bastardmunchen; # Alan Diaz 
CREATE DATABASE          equipo_de_futbol_bastardmunchen; # COMISION 53180

USE                      equipo_de_futbol_bastardmunchen;

CREATE TABLE JUGADORES (
		   JUGADORID             INT AUTO_INCREMENT PRIMARY KEY
,          NOMBRE                VARCHAR(50)
,          APELLIDO              VARCHAR(50)    
,          POSICION              VARCHAR(50)
,          HABILIDADESDESTACADAS VARCHAR(255)
,          FECHANACIMIENTO       DATE
,          NACIONALIDAD          VARCHAR(50)
,          SALARIO               DECIMAL(10, 2)
)
COMMENT "CONTIENE INFORMACION BASICA DE LOS JUGADORES"
;
  
  CREATE TABLE SUPLENTES (
             SUPLENTEID            INT AUTO_INCREMENT PRIMARY KEY
,            NOMBRE                VARCHAR(50)
,            APELLIDO              VARCHAR(50)    
,            POSICION              VARCHAR(50)
,            HABILIDADESDESTACADAS VARCHAR(255) DEFAULT '(NO_INFO)'
,            FECHANACIMIENTO       VARCHAR(10) DEFAULT '(NO_INFO)'
,            NACIONALIDAD          VARCHAR(50) DEFAULT '(NO_INFO)'
,            SALARIO               DECIMAL(10, 2) DEFAULT 0.00
)

COMMENT "CONTIENE INFORMACION BASICA DE LOS SUPLENTES"
;

CREATE TABLE HABILIDADESFUTBOLISTICAS (
		   HABILIDADID      INT AUTO_INCREMENT PRIMARY KEY
,          NOMBREHABILIDAD  VARCHAR(100)
,          DESCRIPCION      VARCHAR(255)
,          NIVEL            VARCHAR(100)
)
COMMENT "CONOCIMIENTOS DETALLADOS, HABILIDADES QUE TIENE LOS JUGADORES Y SU NIVEL"
;

CREATE TABLE HABILIDADESDEJUGADORES (
		   JUGADORID   INT
,          HABILIDADID INT
,          NIVEL ENUM('BAJO', 'MEDIO', 'ALTO')

,          FOREIGN KEY (JUGADORID)               REFERENCES JUGADORES(JUGADORID) 
,          FOREIGN KEY (HABILIDADID)             REFERENCES HABILIDADESFUTBOLISTICAS(HABILIDADID)
,          PRIMARY KEY (JUGADORID, HABILIDADID)
)
COMMENT "EN ESTA ESTRUCTURA, CADA REGISTRO EN LA TABLA REPRESENTARA UNA HABILIDAD ESPECIFICA DE UN JUGADOR."
;

CREATE TABLE ENTRENADORES (
		   ENTRENADORID       INT AUTO_INCREMENT PRIMARY KEY
,          NOMBRE             VARCHAR(50)
,          APELLIDO           VARCHAR(50)
,          POSICION           VARCHAR(50)
,          FECHANACIMIENTO    DATE
,          NACIONALIDAD       VARCHAR(50)
,          SALARIO            DECIMAL(10, 2)
)  
COMMENT "CONTIENE INFORMACION BASICA DE LOS ENTRENADORES"
;
  
CREATE TABLE EQUIPOS (
		   EQUIPOID           INT AUTO_INCREMENT PRIMARY KEY
,          NOMBRE             VARCHAR(100) DEFAULT 'BASTARD_MUNCHEN'
,          PAIS               VARCHAR(100) DEFAULT 'ALEMANIA'
,          ESTADIO            VARCHAR(100) DEFAULT 'BLUELOCK_BASTARD'
)
COMMENT "EQUIPO, NOMBRE DEL CLUB Y DATOS BASICOS"
;
  
CREATE TABLE PARTIDOS (
		   PARTIDOID          INT AUTO_INCREMENT PRIMARY KEY
,          FECHA              DATE
,          HORA               TIME
,		   ESTADIO            VARCHAR(100)
,          EQUIPOVISITANTEID  INT
,          RESULTADOLOCAL     INT
,		   RESULTADOVISITANTE INT
	
,          FOREIGN KEY (EQUIPOVISITANTEID)       REFERENCES EQUIPOS(EQUIPOID)
) 
COMMENT "PARTIDOS QUE SE JUGARON, CONTRA QUIEN Y SUS RESULTADOS" 
;

CREATE TABLE COMENTARIOSOBSERVACIONES (
		   COMENTARIOID       INT AUTO_INCREMENT PRIMARY KEY
,          JUGADORID          INT
,          DESCRIPCION        TEXT
,          FECHACOMENTARIO    DATE

,          FOREIGN KEY (JUGADORID)              REFERENCES JUGADORES(JUGADORID)
)
COMMENT "TABLA DE COMENTARIOS Y OBSERVACIONES"
;

INSERT INTO JUGADORES (
    NOMBRE,
    APELLIDO,
    POSICION,
    FECHANACIMIENTO,
    NACIONALIDAD,
    SALARIO,
    HABILIDADESDESTACADAS
) VALUES (
    'Michael',
    'Kaiser',
    'Delantero',
    '1998-04-27',
    'Alemania',
    1832400.00,  
    'Metavisión, Movimientos sin balón, Potencia de tiro, Consciencia Espacial, "Impacto Kaiser", Ojo del Depredador'
    
), (
    'Alexis',
    'Ness',
    'Mediapunta',
    '2000-10-27',
    'Alemania',
    305350.00,  
    'Flexibilidad, Regate, Pase'
    
), (
    'Yoichi',
    'Isagi',
    'Delantero',
    '1999-04-01',
    'Japon',
    915900.00,  
    'Conciencia espacial, Tiro directo, Movimiento sin balón, Reflejos, Metavisión, Estado de Flow'
    
), (
    'Rensuke',
    'Kunigami',
    'Delantero',
    '1999-03-11',
    'Japon',
    305350.00,  
    'Flexibilidad, Regate, Pase'
    
), (
    'Yo',
    'Hiori',
    'Lateral Derecho',
    '1999-10-27',
    'Alemania',
    305350.00,  
    'Visión, Control de balón, Pase, Reflejos, Metavisión, Estado de Flow'
    
), (
    'Kenyu',
    'Yukimiya',
    'Delantero Extremo',
    '1998-04-28',
    'Japon',
    219888.00,  
    'Regate, Tiro con efecto, Estado de Flow'
     
), (
    'Gin',
    'Gagamaru',
    'Portero',
    '1999-01-02',
    'Japon',
    194456.00,  
    'Reacción explosiva, Flexibilidad'

);

INSERT INTO SUPLENTES (
    NOMBRE,
    APELLIDO,
    POSICION,
    FECHANACIMIENTO,
    NACIONALIDAD,
    SALARIO,
    HABILIDADESDESTACADAS
) VALUES (
    'Gurimu',
    'Igarashi',
    'Delantero',
    '2001-07-06',
    'Japon',
    000.00,  
    'Zambullidas, Simulación de faltas'
    
), (
    'Jim',
    'Kiyora',
    'Lateral Izquierdo',
    '1999-09-02',
    'Japon',
    000.00,  
    'Regate'
    
), (
    'Tappei',
    'Neru',
    'Lateral Derecho',
    '1999-08-31',
    'Japon',
    000.00,  
    'Aceleracion'
    
);

INSERT INTO ENTRENADORES (
     NOMBRE
    ,APELLIDO
    ,POSICION
    ,FECHANACIMIENTO
    ,NACIONALIDAD
    ,SALARIO
    
) VALUES

 (
    'Noel'
    ,'Noa'
    ,'Entrenador/Delantero'
    ,'1971-04-02'
    ,'Paises Bajos'
    ,15000000.00
    
),

 (
    'Jurgen',
    'Klopp',
    'Entrenador',
    '1967-06-16',
    'Alemania',
    12000000.00
);

INSERT INTO EQUIPOS (
    NOMBRE,
    PAIS,
    ESTADIO
    
) VALUES (
    'Real Madrid',
    'España',
    'Santiago Bernabéu'
), (
    'FC Barcelona',
    'España',
    'Camp Nou'
);

INSERT INTO PARTIDOS (
    FECHA,
    HORA,
    ESTADIO,
    EQUIPOVISITANTEID,
    RESULTADOLOCAL,
    RESULTADOVISITANTE
    
) VALUES (
    '2024-04-02',
    '17:00:00',
    'Estadio ABC',
    2,  -- EQUIPOVISITANTEID
    1,  -- RESULTADOLOCAL
    1   -- RESULTADOVISITANTE
    
);
    
    INSERT INTO COMENTARIOSOBSERVACIONES (
    JUGADORID,
    DESCRIPCION,
    FECHACOMENTARIO
    
) VALUES (
    1,  -- JUGADORID
    'Buen desempeño en el último partido.',
    '2024-04-02'  -- FECHACOMENTARIO
);
    
    
-- CORRECIONES 28/03/2024
    
ALTER TABLE JUGADORES
          ADD COLUMN EQUIPOID INT,
          ADD FOREIGN KEY (EQUIPOID)                    REFERENCES EQUIPOS(EQUIPOID);

ALTER TABLE SUPLENTES
          ADD COLUMN EQUIPOID INT,
          ADD FOREIGN KEY (EQUIPOID)                    REFERENCES EQUIPOS(EQUIPOID);

ALTER TABLE ENTRENADORES
          ADD COLUMN EQUIPOID INT,
          ADD FOREIGN KEY (EQUIPOID)                    REFERENCES EQUIPOS(EQUIPOID);
          
          SELECT NOMBRE, APELLIDO, POSICION, HABILIDADESDESTACADAS, SALARIO
          FROM JugadoresDestacados;

          SELECT POSICION, COUNT(*) AS TotalJugadores
          FROM JugadoresPorPosicion
          GROUP BY POSICION;

          SELECT NOMBRE, APELLIDO, POSICION, NACIONALIDAD, SALARIO
          FROM DetallesEntrenadores;

## SEGUNDA ENTREGA DEL PROYECTO FINAL
## COMISION 53180
## ALAN DIAZ

## MODIFICADO 24/4/2024 15:21HS

CREATE VIEW JugadoresDestacados AS
SELECT 
    JUGADORID,
    NOMBRE,
    APELLIDO,
    POSICION,
    HABILIDADESDESTACADAS,
    SALARIO
FROM 
    JUGADORES
WHERE 
    SALARIO > 1000000;
    #Esta vista podría mostrar información sobre los jugadores cuyas habilidades destacadas cumplen ciertos criterios.

CREATE VIEW EntrenadoresPorNacionalidad AS
SELECT 
    NACIONALIDAD,
    COUNT(*) AS TotalEntrenadores
FROM 
    ENTRENADORES
GROUP BY 
    NACIONALIDAD;
    #Esta vista podría mostrar cuántos entrenadores hay de cada nacionalidad.

CREATE VIEW PartidosPendientes AS
SELECT 
    PARTIDOID,
    FECHA,
    HORA,
    ESTADIO,
    EQUIPOVISITANTEID,
    RESULTADOLOCAL,
    RESULTADOVISITANTE
FROM 
    PARTIDOS
WHERE 
    FECHA > CURDATE();
    #Esta vista podría mostrar los partidos programados para el futuro que aún no se han jugado.
    
SELECT * FROM JugadoresDestacados;
SELECT * FROM EntrenadoresPorNacionalidad;
SELECT * FROM PartidosPendientes;

DELIMITER $$
CREATE FUNCTION CalcularEdad(FECHANACIMIENTO DATE)
RETURNS INT
BEGIN
    RETURN YEAR(CURDATE()) - YEAR(FECHANACIMIENTO) - (RIGHT(CURDATE(), 5) < RIGHT(FECHANACIMIENTO, 5));
END $$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION SalarioPromedioEquipo(EQUIPOID INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT AVG(SALARIO) INTO promedio FROM JUGADORES WHERE EQUIPOID = EQUIPOID;
    RETURN promedio;
END $$
DELIMITER ;

DELIMITER $$


CREATE PROCEDURE AgregarJugador(
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_posicion VARCHAR(50),
    IN p_fecha_nacimiento DATE,
    IN p_nacionalidad VARCHAR(50),
    IN p_salario DECIMAL(10,2)
)
BEGIN
    INSERT INTO JUGADORES (NOMBRE, APELLIDO, POSICION, FECHANACIMIENTO, NACIONALIDAD, SALARIO)
    VALUES (p_nombre, p_apellido, p_posicion, p_fecha_nacimiento, p_nacionalidad, p_salario);
END $$
DELIMITER ;
## Descripcion: Este procedimiento almacenado permite agregar un nuevo jugador a la base de datos de jugadores de fútbol.
## Objetivo/beneficio: Simplifica el proceso de inserción de nuevos jugadores al encapsular la lógica de inserción en un procedimiento almacenado reutilizable.
## Tablas que interactúa: Interactúa principalmente con la tabla JUGADORES, donde se almacenan los datos de los jugadores de fútbol.




DROP PROCEDURE IF EXISTS ActualizarSalarioJugador;

DELIMITER $$
CREATE PROCEDURE ActualizarSalarioJugador(
    IN p_jugador_id INT,
    IN p_nuevo_salario DECIMAL(10,2)
)
BEGIN
    UPDATE JUGADORES
    SET SALARIO = p_nuevo_salario
    WHERE JUGADORID = p_jugador_id;
END $$
DELIMITER ;
## Descripción: Este procedimiento almacenado permite actualizar el salario de un jugador existente en la base de datos.
## Objetivo/beneficio: Facilita la actualización de información de salario de los jugadores de fútbol al encapsular la lógica de actualización en un procedimiento almacenado.
## Tablas que interactúa: Interactúa principalmente con la tabla JUGADORES, donde se almacenan los datos de los jugadores de fútbol.



DELIMITER $$
CREATE PROCEDURE EliminarJugador(
    IN p_jugador_id INT
)
BEGIN
    DELETE FROM JUGADORES WHERE JUGADORID = p_jugador_id;
END $$
DELIMITER ;
## Descripción: Este procedimiento almacenado permite eliminar un jugador de la base de datos.
## Objetivo/beneficio: Simplifica la eliminación de jugadores de fútbol al encapsular la lógica de eliminación en un procedimiento almacenado.
## Tablas que interactúa: Interactúa principalmente con la tabla JUGADORES, donde se almacenan los datos de los jugadores de fútbol.

CALL AgregarJugador('Lionel', 'Messi', 'Delantero', '1987-06-24', 'Argentina', 1000000.00);

CALL ActualizarSalarioJugador(1, 1500000.00);

CALL EliminarJugador(2);

DELIMITER $$
CREATE TRIGGER Audit_Jugadores
AFTER INSERT ON JUGADORES
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Jugadores (accion, jugador_id, fecha)
    VALUES ('INSERCION', NEW.JUGADORID, NOW());
END $$
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER Limite_Salario
BEFORE INSERT ON JUGADORES
FOR EACH ROW
BEGIN
    DECLARE salario_maximo DECIMAL(10,2);
    SET salario_maximo = 10000000.00;
    
    IF NEW.SALARIO > salario_maximo THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El salario excede el límite permitido';
    END IF;
END $$
DELIMITER ;
