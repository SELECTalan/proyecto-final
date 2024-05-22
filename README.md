<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Entrega de proyecto final</center>
@Alan Diaz

@Comision_53180

@Santiago Angel Gonzalez Martin , Carla Palermo

@Anderson Ocaña

---

## Tematica del proyecto
Este proyecto consiste en crear una base de datos para realizar un seguimiento de la información de un equipo de fútbol llamado "BastardMünchen". Esta base de datos le permite anotar información sobre equipos, jugadores, partidos, lesiones, títulos y más. El objetivo es facilitar el manejo de datos y crear informes útiles para el personal del club.

## Modelo de negocio
Gestión de Jugadores: Permite registrar información detallada sobre los jugadores, incluyendo datos personales, posición en el campo, habilidades destacadas, historial de lesiones y contratos.

Gestión de Entrenadores: Facilita el seguimiento de los entrenadores asociados con cada equipo, incluyendo sus datos personales, historial profesional y detalles de los contratos.

Planificación de Partidos: Permite programar y registrar información sobre los partidos, como la fecha, hora, estadio y equipos participantes, así como los resultados de los encuentros.

Control de Lesiones: Proporciona herramientas para registrar y gestionar las lesiones de los jugadores, incluyendo el tipo de lesión, fechas de inicio y fin, y el seguimiento de su recuperación.

Administración de Contratos: Permite gestionar los contratos de los jugadores, entrenadores y patrocinadores, incluyendo detalles como fechas de inicio y fin, salarios y términos específicos.

Seguimiento de Patrocinadores: Facilita el seguimiento de los patrocinadores asociados con el equipo, incluyendo información sobre la empresa, términos del contrato y pagos asociados.

Análisis y Reportes: Ofrece herramientas para analizar datos relevantes y generar informes personalizados sobre aspectos como el rendimiento del equipo, la situación financiera y el estado de las lesiones.

## Diagrama de Entidad-Relación (DER)

![Diagrama de Entidad-Relación](/workspaces/proyecto-final/DER.png)


## Listado de tablas y descripcion

### `Equipos`
Contiene información básica de los equipos de fútbol.

| Columna    | Descripción                  | Tipo de Datos | Tipo de Clave |
|------------|------------------------------|---------------|---------------|
| equipo_id  | Identificador del equipo     | INT           | PK            |
| nombre     | Nombre del equipo            | VARCHAR(100)  |               |
| ciudad     | Ciudad del equipo            | VARCHAR(100)  |               |

### `Jugadores`
Contiene información básica de los jugadores.

| Columna           | Descripción                        | Tipo de Datos | Tipo de Clave |
|-------------------|------------------------------------|---------------|---------------|
| jugador_id        | Identificador del jugador          | INT           | PK            |
| nombre            | Nombre del jugador                 | VARCHAR(100)  |               |
| fecha_nacimiento  | Fecha de nacimiento del jugador    | DATE          |               |
| equipo_id         | Identificador del equipo           | INT           | FK            |
| salario           | Salario del jugador                | DECIMAL(10,2) |               |

### `Suplentes`
Contiene información básica de los suplentes.

| Columna           | Descripción                     | Tipo de Datos | Tipo de Clave |
|-------------------|---------------------------------|---------------|---------------|
| suplente_id       | Identificador del suplente      | INT           | PK            |
| nombre            | Nombre del suplente             | VARCHAR(100)  |               |
| equipo_id         | Identificador del equipo        | INT           | FK            |
| posicion          | Posición del suplente           | VARCHAR(50)   |               |

### `Entrenadores`
Contiene información básica de los entrenadores.

| Columna           | Descripción                     | Tipo de Datos | Tipo de Clave |
|-------------------|---------------------------------|---------------|---------------|
| entrenador_id     | Identificador del entrenador    | INT           | PK            |
| nombre            | Nombre del entrenador           | VARCHAR(100)  |               |
| equipo_id         | Identificador del equipo        | INT           | FK            |
| experiencia       | Años de experiencia             | INT           |               |

### `Partidos`
Contiene información de los partidos, equipos participantes y resultados.

| Columna           | Descripción                    | Tipo de Datos | Tipo de Clave |
|-------------------|--------------------------------|---------------|---------------|
| partido_id        | Identificador del partido      | INT           | PK            |
| equipo_local_id   | Identificador del equipo local | INT           | FK            |
| equipo_visitante_id| Identificador del equipo visitante| INT         | FK            |
| fecha             | Fecha del partido              | DATE          |               |
| resultado         | Resultado del partido          | VARCHAR(10)   |               |

### `Estadios`
Contiene información de los estadios.

| Columna           | Descripción                 | Tipo de Datos | Tipo de Clave |
|-------------------|-----------------------------|---------------|---------------|
| estadio_id        | Identificador del estadio   | INT           | PK            |
| nombre            | Nombre del estadio          | VARCHAR(100)  |               |
| ciudad            | Ciudad del estadio          | VARCHAR(100)  |               |
| capacidad         | Capacidad del estadio       | INT           |               |

### `Habilidades`
Contiene información sobre las habilidades de los jugadores.

| Columna           | Descripción                         | Tipo de Datos | Tipo de Clave |
|-------------------|-------------------------------------|---------------|---------------|
| habilidad_id      | Identificador de la habilidad       | INT           | PK            |
| nombre            | Nombre de la habilidad              | VARCHAR(100)  |               |
| descripcion       | Descripción de la habilidad         | VARCHAR(255)  |               |

### `Comentarios y Observaciones`
Contiene comentarios y observaciones sobre los jugadores.

| Columna           | Descripción                                | Tipo de Datos | Tipo de Clave |
|-------------------|--------------------------------------------|---------------|---------------|
| comentario_id     | Identificador del comentario               | INT           | PK            |
| jugador_id        | Identificador del jugador                  | INT           | FK            |
| comentario        | Comentario o observación                   | TEXT          |               |
| fecha             | Fecha del comentario                       | DATE          |               |

### `HabilidadesJugadores`
Relaciona jugadores con sus habilidades y niveles.

| Columna           | Descripción                                | Tipo de Datos | Tipo de Clave |
|-------------------|--------------------------------------------|---------------|---------------|
| habilidad_id      | Identificador de la habilidad              | INT           | PK, FK        |
| jugador_id        | Identificador del jugador                  | INT           | PK, FK        |
| nivel             | Nivel de la habilidad del jugador          | INT           |               |

### `Patrocinadores`
Contiene información de los patrocinadores.

| Columna           | Descripción                                | Tipo de Datos | Tipo de Clave |
|-------------------|--------------------------------------------|---------------|---------------|
| patrocinador_id   | Identificador del patrocinador             | INT           | PK            |
| nombre            | Nombre del patrocinador                    | VARCHAR(100)  |               |
| contrato_id       | Identificador del contrato                 | INT           | FK            |

### `Contratos`
Contiene información de los contratos de jugadores.

| Columna           | Descripción                          | Tipo de Datos | Tipo de Clave |
|-------------------|--------------------------------------|---------------|---------------|
| contrato_id       | Identificador del contrato           | INT           | PK            |
| jugador_id        | Identificador del jugador            | INT           | FK            |
| equipo_id         | Identificador del equipo             | INT           | FK            |
| fecha_inicio      | Fecha de inicio del contrato         | DATE          |               |
| fecha_fin         | Fecha de fin del contrato            | DATE          |               |
| salario           | Salario acordado en el contrato      | DECIMAL(10,2) |               |

### `Títulos`
Contiene información de los títulos ganados por los equipos.

| Columna    | Descripción                | Tipo de Datos | Tipo de Clave |
|------------|----------------------------|---------------|---------------|
| titulo_id  | Identificador del título   | INT           | PK            |
| nombre     | Nombre del título          | VARCHAR(100)  |               |
| año        | Año en que se ganó el título| INT          |               |
| equipo_id  | Identificador del equipo   | INT           | FK            |

### `Aficionados`
Contiene información de los aficionados.

| Columna       | Descripción                      | Tipo de Datos | Tipo de Clave |
|---------------|----------------------------------|---------------|---------------|
| aficionado_id | Identificador del aficionado     | INT           | PK            |
| nombre        | Nombre del aficionado            | VARCHAR(100)  |               |
| equipo_id     | Identificador del equipo         | INT           | FK            |

### `Medicos`
Contiene información de los médicos de los equipos.

| Columna       | Descripción                       | Tipo de Datos | Tipo de Clave |
|---------------|-----------------------------------|---------------|---------------|
| medico_id     | Identificador del médico          | INT           | PK            |
| nombre        | Nombre del médico                 | VARCHAR(100)  |               |
| equipo_id     | Identificador del equipo          | INT           | FK            |
| especialidad  | Especialidad del médico           | VARCHAR(100)  |               |

### `Lesiones`
Contiene información de las lesiones de los jugadores.

| Columna           | Descripción                        | Tipo de Datos | Tipo de Clave |
|-------------------|------------------------------------|---------------|---------------|
| lesion_id         | Identificador de la lesión         | INT           | PK            |
| jugador_id        | Identificador del jugador          | INT           | FK            |
| fecha_inicio      | Fecha de inicio de la lesión       | DATE          |               |
| fecha_fin         | Fecha de fin de la lesión          | DATE          |               |
| descripcion       | Descripción de la lesión           | VARCHAR(255)  |               |


## Estructura e ingesta de datos
Se realiza principalmente por medio del archivo population.sql
La carga de la tabla reserva se realiza por medio de un csv colocado en el directorio ./structure/data-csv

## Objetos de la base de datos
### Tablas

1. **Equipos:** Contiene información básica de los equipos de fútbol.
2. **Jugadores:** Contiene información básica de los jugadores.
3. **Suplentes:** Contiene información básica de los suplentes.
4. **Entrenadores:** Contiene información básica de los entrenadores.
5. **Partidos:** Contiene información de los partidos, equipos participantes y resultados.
6. **Estadios:** Contiene información de los estadios.
7. **Habilidades:** Contiene información sobre las habilidades de los jugadores.
8. **Comentarios y Observaciones:** Contiene comentarios y observaciones sobre los jugadores.
9. **HabilidadesJugadores:** Relaciona jugadores con sus habilidades y niveles.
10. **Patrocinadores:** Contiene información de los patrocinadores.
11. **Contratos:** Contiene información de los contratos de jugadores.
12. **Titulos:** Contiene información de los títulos ganados por los equipos.
13. **Aficionados:** Contiene información de los aficionados.
14. **Medicos:** Contiene información de los médicos de los equipos.
15. **Lesiones:** Contiene información de las lesiones de los jugadores.

### Vistas

1. **JugadoresDestacados:** Vista para jugadores destacados (con salario superior a 1,000,000).
2. **EntrenadoresPorNacionalidad:** Vista para entrenadores agrupados por nacionalidad.
3. **PartidosPendientes:** Vista para partidos pendientes.
4. **JugadoresConLesionesActuales:** Vista para jugadores con lesiones actuales.
5. **PatrocinadoresYJugadores:** Vista para patrocinadores y jugadores.

### Funciones

1. **CalcularDuracionLesion:** Calcula la duración de una lesión en días.
2. **SalarioTotalEquipo:** Obtiene el salario total de un equipo.

### Triggers

1. **ActualizarFechaInicioLesion:** Actualiza la fecha de inicio de la lesión.
2. **ActualizarSalarioTotalEquipo:** Actualiza el salario total de un equipo.

### Procedimientos Almacenados

1. **ObtenerSalarioPorPosicion:** Obtiene el salario promedio de jugadores por posición.
2. **GenerarReporteLesiones:** Genera un reporte de las lesiones de los jugadores.

## Roles y permisos
### Rol: Entrenador

**Descripción:** Este rol tiene acceso limitado para realizar operaciones relacionadas con la gestión de jugadores y partidos.

**Permisos:**
- Ver información de jugadores, partidos y lesiones.
- Insertar comentarios y observaciones sobre jugadores.
- Actualizar resultados de partidos.
- No tiene permisos para realizar cambios estructurales en la base de datos.

## Back up de la base de datos
Se puede generar un comando en el archivo make backup que me permite ejecutar un backup de manera manual.

## Herramientas y tecnologias usadas
Makefile
Docker
ChatGPT
GoogleSheets
MySQL Workbench

## Herramientas y Tecnologías Utilizadas
### Base de Datos

- MySQL: Sistema de gestión de bases de datos relacional utilizado para almacenar y gestionar los datos del proyecto.

### Lenguajes de Programación

- SQL: Lenguaje utilizado para realizar consultas y manipular datos en la base de datos.

### Entorno de Desarrollo Integrado (IDE)

- MySQL Workbench: Herramienta de diseño visual de bases de datos MySQL que se utilizó para crear y modificar el esquema de la base de datos, así como para escribir consultas SQL y realizar tareas de administración.

### Control de Versiones

- Git: Sistema de control de versiones distribuido utilizado para gestionar el código fuente y realizar seguimiento de los cambios en el proyecto.
- GitHub: Plataforma de alojamiento de repositorios Git utilizada para colaborar en el desarrollo del proyecto y almacenar el código fuente de forma remota.

### Otros

- Bash: Interfaz de línea de comandos utilizada para ejecutar comandos y scripts relacionados con el proyecto.


## Como levantar el proyecto en CodeSpaces GitHub

1. **Accede al Repositorio:**
   Ve al repositorio de GitHub donde está alojado este proyecto.

2. **Abre el Proyecto en CodeSpaces:**
   Haz clic en el botón "Code" y selecciona "Open with CodeSpaces". Esto abrirá el proyecto en un entorno de desarrollo en la nube.

3. **Espera a que se Configure el Entorno:**
   CodeSpaces configurará el entorno de desarrollo según las especificaciones del proyecto. Esto puede llevar unos minutos la primera vez que se abre el proyecto.

4. **Explora el Proyecto:**
   Una vez que CodeSpaces haya configurado el entorno, podrás explorar y editar el código del proyecto como lo harías en tu IDE local.

5. **Realiza Cambios:**
   Haz los cambios necesarios en el código según tus requisitos.

6. **Guarda y Confirma los Cambios:**
   Guarda los cambios en los archivos y confírmalos en tu repositorio Git como lo harías normalmente.

7. **Prueba el Proyecto:**
   Puedes probar el proyecto directamente en el entorno de CodeSpaces para asegurarte de que todo funcione como se espera.


#### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si te da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpiar la base de datos
    - `make test-db` para mirar los datos de cada tabla
    - `make backup-db` para realizar un backup de mi base de datos
    - `make access-db` para acceder a la base de datos
