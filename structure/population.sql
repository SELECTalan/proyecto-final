USE                      equipo_de_futbol_bastardmunchen;

-- Insertar datos en la tabla Equipos
INSERT INTO Equipos (nombre, pais, estadio) VALUES
('Bastard Munchen', 'Alemania', 'Blue Lock Stadium'),
('Real Madrid', 'Espania', 'Santiago Bernabeu'),
('FC Barcelona', 'Espania', 'Camp Nou');

-- Insertar datos en la tabla Jugadores
INSERT INTO Jugadores (nombre, apellido, posicion, fecha_nacimiento, nacionalidad, salario, habilidades_destacadas, equipo_id) VALUES
('Michael', 'Kaiser', 'Delantero', '1998-04-27', 'Alemania', 1832400.00, 'Metavision, Movimientos sin balon, Potencia de tiro, Consciencia Espacial, "Impacto Kaiser", Ojo del Depredador', 1),
('Alexis', 'Ness', 'Mediapunta', '2000-10-27', 'Alemania', 305350.00, 'Flexibilidad, Regate, Pase', 1),
('Yoichi', 'Isagi', 'Delantero', '1999-04-01', 'Japón', 915900.00, 'Conciencia espacial, Tiro directo, Movimiento sin balon, Reflejos, Metavision, Estado de Flow', 1);

-- Insertar datos en la tabla Entrenadores
INSERT INTO Entrenadores (nombre, apellido, posicion, fecha_nacimiento, nacionalidad, salario, equipo_id) VALUES
('Noel', 'Noa', 'Entrenador/Delantero', '1971-04-02', 'Paises Bajos', 15000000.00, 1),
('Jurgen', 'Klopp', 'Entrenador', '1967-06-16', 'Alemania', 12000000.00, 2);

-- Insertar datos en la tabla Partidos
INSERT INTO Partidos (fecha, hora, estadio, equipo_local_id, equipo_visitante_id, resultado_local, resultado_visitante) VALUES
('2024-04-02', '17:00:00', 'Blue Lock Stadium', 1, 2, 1, 1);

-- Insertar datos en la tabla Estadios
INSERT INTO Estadios (nombre, capacidad, ciudad, equipo_id) VALUES
('Blue Lock Stadium', 50000, 'Munich', 1),
('Santiago Bernabéu', 81044, 'Madrid', 2),
('Camp Nou', 99354, 'Barcelona', 3);

-- Insertar datos en la tabla Habilidades
INSERT INTO Habilidades (nombre, descripcion) VALUES
('Metavision', 'Habilidad de ver el campo de juego desde una perspectiva amplia'),
('Movimiento sin balon', 'Capacidad de moverse estratégicamente sin tener la pelota'),
('Potencia de tiro', 'Fuerza y precisión en los disparos a porteria');

-- Insertar datos en la tabla Comentarios y Observaciones
INSERT INTO ComentariosObservaciones (jugador_id, descripcion, fecha_comentario) VALUES
(1, 'Buen desempeño en el ultimo partido.', '2024-04-02');

-- Insertar datos en la tabla Patrocinadores
INSERT INTO Patrocinadores (nombre, industria) VALUES
('Adidas', 'Deportes'),
('Nike', 'Deportes'),
('Puma', 'Deportes');

-- Insertar datos en la tabla Contratos
INSERT INTO Contratos (jugador_id, equipo_id, patrocinador_id, fecha_inicio, fecha_fin, salario) VALUES
(1, 1, 1, '2023-07-01', '2025-06-30', 1832400.00),
(2, 1, 2, '2023-07-01', '2025-06-30', 305350.00),
(3, 1, 3, '2023-07-01', '2025-06-30', 915900.00);

-- Insertar datos en la tabla Titulos
INSERT INTO Titulos (nombre, anio, equipo_id) VALUES
('Champions League', 2023, 1),
('La Liga', 2023, 2),
('Copa del Rey', 2023, 3);

-- Insertar datos en la tabla Aficionados
INSERT INTO Aficionados (nombre, apellido, fecha_nacimiento, equipo_favorito) VALUES
('Juan', 'Perez', '1990-01-01', 1),
('Luis', 'Gonzalez', '1985-02-15', 2),
('Maria', 'Lopez', '1992-03-10', 3);

-- Insertar datos en la tabla Medicos
INSERT INTO Medicos (nombre, apellido, especialidad, equipo_id) VALUES
('Carlos', 'Gomez', 'Traumatología', 1),
('Roberto', 'Fernandez', 'Fisioterapia', 2),
('Ana', 'Martinez', 'Medicina Deportiva', 3);

-- Insertar datos en la tabla Lesiones
INSERT INTO Lesiones (jugador_id, tipo_lesion, fecha_inicio, fecha_fin) VALUES
(1, 'Rotura de ligamentos', '2024-01-15', '2024-04-15'),
(2, 'Fractura de tobillo', '2024-02-10', '2024-05-10'),
(3, 'Distensión muscular', '2024-03-20', '2024-04-20');
