USE                      equipo_de_futbol_bastardmunchen;

-- 1. Eliminar roles y usuarios existentes (si es necesario)
DROP ROLE IF EXISTS Entrenador;
DROP USER IF EXISTS 'nombre_usuario'@'%';

-- 2. Crear los roles
CREATE ROLE Entrenador;

-- 3. Crear los usuarios
CREATE USER 'nombre_usuario'@'%' IDENTIFIED BY 'tu_contraseña';

-- 4. Asignar roles a los usuarios
GRANT Entrenador TO 'nombre_usuario'@'%';

-- 5. Conceder permisos a los roles

-- Conceder permisos de lectura en vistas relevantes
GRANT SELECT ON equipo_de_futbol_bastardmunchen.Jugadores TO Entrenador;
GRANT SELECT ON equipo_de_futbol_bastardmunchen.Partidos TO Entrenador;

-- Conceder permisos de edición en tablas relevantes
GRANT INSERT, UPDATE ON equipo_de_futbol_bastardmunchen.Lesiones TO Entrenador;