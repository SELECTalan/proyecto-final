USE                      equipo_de_futbol_bastardmunchen;

CREATE VIEW vista_jugadores_destacados AS
SELECT JUGADORID             
, NOMBRE               
, APELLIDO                 
, POSICION              
, HABILIDADESDESTACADAS 
, FECHANACIMIENTO      
, NACIONALIDAD         
, SALARIO
FROM jugadores
WHERE salario > 1000000;

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
    
    CREATE VIEW Vista_Equipos_Entrenadores AS
SELECT 
    E.NOMBRE AS NOMBRE_EQUIPO,
    E.PAIS,
    E.ESTADIO,
    ET.NOMBRE AS NOMBRE_ENTRENADOR,
    ET.APELLIDO AS APELLIDO_ENTRENADOR,
    ET.NACIONALIDAD AS NACIONALIDAD_ENTRENADOR
FROM 
    EQUIPOS E
JOIN 
    ENTRENADORES ET ON E.EQUIPOID = ET.EQUIPOID;

CREATE VIEW Vista_Jugadores_Posicion_Nacionalidad AS
SELECT 
    POSICION,
    NACIONALIDAD,
    COUNT(*) AS NUM_JUGADORES
FROM 
    JUGADORES
GROUP BY 
    POSICION, NACIONALIDAD;