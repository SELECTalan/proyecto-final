USE                      equipo_de_futbol_bastardmunchen;

-- Vista para jugadores destacados (con salario superior a 1,000,000)
CREATE VIEW JugadoresDestacados AS
SELECT 
    jugador_id,
    nombre,
    apellido,
    posicion,
    habilidades_destacadas,
    salario
FROM 
    Jugadores
WHERE 
    salario > 1000000;

-- Vista para entrenadores agrupados por nacionalidad
CREATE VIEW EntrenadoresPorNacionalidad AS
SELECT 
    nacionalidad,
    COUNT(*) AS total_entrenadores
FROM 
    Entrenadores
GROUP BY 
    nacionalidad;

-- Vista para partidos pendientes
CREATE VIEW PartidosPendientes AS
SELECT 
    partido_id,
    fecha,
    hora,
    estadio,
    equipo_local_id,
    equipo_visitante_id,
    resultado_local,
    resultado_visitante
FROM 
    Partidos
WHERE 
    fecha > CURDATE();

-- Vista para jugadores con lesiones actuales
CREATE VIEW JugadoresConLesionesActuales AS
SELECT 
    j.jugador_id,
    j.nombre,
    j.apellido,
    l.tipo_lesion,
    l.fecha_inicio,
    l.fecha_fin
FROM 
    Jugadores j
JOIN 
    Lesiones l ON j.jugador_id = l.jugador_id
WHERE 
    l.fecha_fin IS NULL OR l.fecha_fin > CURDATE();

-- Vista para patrocinadores y jugadores
CREATE VIEW PatrocinadoresYJugadores AS
SELECT 
    p.nombre AS patrocinador,
    j.nombre AS jugador_nombre,
    j.apellido AS jugador_apellido,
    c.fecha_inicio,
    c.fecha_fin
FROM 
    Patrocinadores p
JOIN 
    Contratos c ON p.patrocinador_id = c.patrocinador_id
JOIN 
    Jugadores j ON c.jugador_id = j.jugador_id;
