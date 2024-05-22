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

CREATE TABLE LESIONES (
    LESIONID        INT AUTO_INCREMENT PRIMARY KEY,
    JUGADORID       INT,
    FECHA_LESION    DATE,
    GRAVEDAD        VARCHAR(50),
    TIPO_LESION     VARCHAR(100),
    RECUPERACION_ESTIMADA INT,  -- en días
    
    FOREIGN KEY (JUGADORID) REFERENCES JUGADORES(JUGADORID)
);

CREATE TABLE CONTRATOS_JUGADORES (
    CONTRATOID              INT AUTO_INCREMENT PRIMARY KEY,
    JUGADORID               INT,
    FECHA_INICIO            DATE,
    FECHA_FIN               DATE,
    SALARIO                 DECIMAL(10, 2),
    CLAUSULAS               TEXT,
   
   FOREIGN KEY (JUGADORID) REFERENCES JUGADORES(JUGADORID)
);

CREATE TABLE EQUIPOS_RIVALES (
    RIVALID               INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE_EQUIPO         VARCHAR(100),
    LIGA                  VARCHAR(100),
    CIUDAD                VARCHAR(100)
);

CREATE TABLE GOLES_MARCADOS (
    GOLESID            INT AUTO_INCREMENT PRIMARY KEY,
    PARTIDOID          INT,
    JUGADORID          INT,
    MINUTO             INT,
    
    FOREIGN KEY (PARTIDOID) REFERENCES PARTIDOS(PARTIDOID),
    
    FOREIGN KEY (JUGADORID) REFERENCES JUGADORES(JUGADORID)
);

CREATE TABLE PALMARES_EQUIPO (
    PALMARESID           INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE_TROFEO        VARCHAR(100),
    ANIO                 INT,
    COMPETICION          VARCHAR(100),
    EQUIPOID             INT,
    
    FOREIGN KEY (EQUIPOID) REFERENCES EQUIPOS(EQUIPOID)
);

CREATE TABLE ESTADISTICAS_PARTIDOS (
    ESTADISTICASID            INT AUTO_INCREMENT PRIMARY KEY,
    PARTIDOID                 INT,
    POSESION_BALON            DECIMAL(5, 2),  -- Porcentaje de posesión de balón
    DISPAROS_PUERTA           INT,
    TARJETAS_AMARILLAS        INT,
    TARJETAS_ROJAS            INT,
    GOLES_LOCAL               INT,
    GOLES_VISITANTE           INT,
    
    FOREIGN KEY (PARTIDOID) REFERENCES PARTIDOS(PARTIDOID)
);

CREATE TABLE HISTORIAL_CAMBIOS_JUGADORES (
    CAMBIOID                        INT AUTO_INCREMENT PRIMARY KEY,
    JUGADORID                       INT,
    FECHA_CAMBIO                    DATE,
    TIPO_CAMBIO                     VARCHAR(100),  -- Transferencia, cesión, renovación de contrato, etc.
    DETALLES_CAMBIO                 TEXT,
    
    FOREIGN KEY (JUGADORID) REFERENCES JUGADORES(JUGADORID)
);


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



    





