DROP DATABASE IF EXISTS equipo_de_futbol_bastardmunchen;
CREATE DATABASE equipo_de_futbol_bastardmunchen;
USE equipo_de_futbol_bastardmunchen;

-- Tabla de Equipos
CREATE TABLE Equipos (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    estadio VARCHAR(100) NOT NULL
) COMMENT 'Contiene información básica de los equipos de fútbol';

-- Tabla de Jugadores
CREATE TABLE Jugadores (
    jugador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    habilidades_destacadas VARCHAR(255),
    fecha_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id)
) COMMENT 'Contiene información básica de los jugadores';

-- Tabla de Suplentes
CREATE TABLE Suplentes (
    suplente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    posicion VARCHAR(50) NOT NULL,
    habilidades_destacadas VARCHAR(255) DEFAULT '(NO_INFO)',
    fecha_nacimiento DATE DEFAULT NULL,
    nacionalidad VARCHAR(50) DEFAULT '(NO_INFO)',
    salario DECIMAL(10, 2) DEFAULT 0.00,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id)
) COMMENT 'Contiene información básica de los suplentes';

-- Tabla de Entrenadores
CREATE TABLE Entrenadores (
    entrenador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    posicion VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id)
) COMMENT 'Contiene información básica de los entrenadores';

-- Tabla de Partidos
CREATE TABLE Partidos (
    partido_id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estadio VARCHAR(100) NOT NULL,
    equipo_local_id INT NOT NULL,
    equipo_visitante_id INT NOT NULL,
    resultado_local INT,
    resultado_visitante INT,
    FOREIGN KEY (equipo_local_id) REFERENCES Equipos(equipo_id),
    FOREIGN KEY (equipo_visitante_id) REFERENCES Equipos(equipo_id)
) COMMENT 'Contiene información de los partidos, equipos participantes y resultados';

-- Tabla de Estadios
CREATE TABLE Estadios (
    estadio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id)
) COMMENT 'Contiene información de los estadios';

-- Tabla de Habilidades
CREATE TABLE Habilidades (
    habilidad_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
) COMMENT 'Contiene información sobre las habilidades de los jugadores';

-- Tabla de Comentarios y Observaciones
CREATE TABLE ComentariosObservaciones (
    comentario_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_comentario DATE NOT NULL,
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(jugador_id)
) COMMENT 'Contiene comentarios y observaciones sobre los jugadores';

-- Tabla intermedia para relacionar Jugadores con Habilidades
CREATE TABLE HabilidadesJugadores (
    jugador_id INT NOT NULL,
    habilidad_id INT NOT NULL,
    nivel ENUM('BAJO', 'MEDIO', 'ALTO'),
    PRIMARY KEY (jugador_id, habilidad_id),
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(jugador_id),
    FOREIGN KEY (habilidad_id) REFERENCES Habilidades(habilidad_id)
) COMMENT 'Relaciona jugadores con sus habilidades y niveles';

-- Tabla de Patrocinadores
CREATE TABLE Patrocinadores (
    patrocinador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    industria VARCHAR(100) NOT NULL
) COMMENT 'Contiene información de los patrocinadores';

-- Tabla de Contratos
CREATE TABLE Contratos (
    contrato_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    equipo_id INT NOT NULL,
    patrocinador_id INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(jugador_id),
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id),
    FOREIGN KEY (patrocinador_id) REFERENCES Patrocinadores(patrocinador_id)
) COMMENT 'Contiene información de los contratos de jugadores';

-- Tabla de Títulos
CREATE TABLE Titulos (
    titulo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    anio INT NOT NULL,
    equipo_id INT NOT NULL,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id)
) COMMENT 'Contiene información de los títulos ganados por los equipos';


-- Tabla de Aficionados
CREATE TABLE Aficionados (
    aficionado_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    equipo_favorito INT NOT NULL,
    FOREIGN KEY (equipo_favorito) REFERENCES Equipos(equipo_id)
) COMMENT 'Contiene información de los aficionados';

-- Tabla de Médicos
CREATE TABLE Medicos (
    medico_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    equipo_id INT NOT NULL,
    FOREIGN KEY (equipo_id) REFERENCES Equipos(equipo_id)
) COMMENT 'Contiene información de los médicos de los equipos';

-- Tabla de Lesiones
CREATE TABLE Lesiones (
    lesion_id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    tipo_lesion VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (jugador_id) REFERENCES Jugadores(jugador_id)
) COMMENT 'Contiene información de las lesiones de los jugadores';





