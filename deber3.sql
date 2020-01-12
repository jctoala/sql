CREATE TABLE Personas (
	ci varchar (10) NOT NULL,
    nombre varchar (25),
    apellido varchar (25),
    direccion varchar (50),
    poblacion varchar (25),
    fecha_nacimiento datetime,
    codigo_postal varchar (25),
    telefono varchar (10),
    CONSTRAINT PK_Personas_ci PRIMARY KEY (ci)
);
CREATE TABLE Profesores (
	ci varchar (10) NOT NULL,
    CONSTRAINT PK_Profesores_ci PRIMARY KEY (ci),
    CONSTRAINT FK_Profesores_Personas_ci FOREIGN KEY (ci) REFERENCES Personas (ci)
);
CREATE TABLE Alumnos (
	ci varchar (10) NOT NULL,
    CONSTRAINT PK_Alumnos_ci PRIMARY KEY (ci),
    CONSTRAINT FK_Alumnos_Personas_ci FOREIGN KEY (ci) REFERENCES Personas (ci)
);
CREATE TABLE Cursos (
	codigo varchar (10) NOT NULL,
    nombre varchar (25),
    ci_profesor varchar (10),
    CONSTRAINT PK_Cursos_codigo PRIMARY KEY (codigo),
    CONSTRAINT FK_Cursos_Profesores_ci FOREIGN KEY (ci_profesor) REFERENCES Profesores (ci)
);
CREATE TABLE Asignaturas (
	codigo varchar (10) NOT NULL,
    nombre varchar (25),
    hora int,
    ci_profesor varchar (10),
    codigo_curso varchar (10),
    CONSTRAINT PK_Asignaturas_codigo PRIMARY KEY (codigo),
    CONSTRAINT FK_Asignaturas_Profesores_ci FOREIGN KEY (ci_profesor) REFERENCES Profesores (ci),
    CONSTRAINT FK_Asignaturas_Cursos_codigo FOREIGN KEY (codigo_curso) REFERENCES Cursos (codigo)
);
CREATE TABLE Calificaciones (
	nota float,
    incidencia int,
    ci_alumno varchar (10) NOT NULL,
    codigo varchar (10) NOT NULL,
    CONSTRAINT PK_Calificaciones_ci_codigo PRIMARY KEY (ci_alumno, codigo),
    CONSTRAINT FK_Calificaciones_Alumnos_ci FOREIGN KEY (ci_alumno) REFERENCES Alumnos (ci),
    CONSTRAINT FK_Calificaciones_Asignaturas_codigo FOREIGN KEY (codigo) REFERENCES Asignaturas (codigo)
);
CREATE TABLE Aulas (
	codigo varchar (10) NOT NULL,
    piso int,
    pupitres int,
    CONSTRAINT PK_Aulas_codigo PRIMARY KEY (codigo)
);
CREATE TABLE Impartidas (
	fecha datetime,
    codigo_asignatura varchar (10) NOT NULL,
    codigo_aula varchar (10) NOT NULL,
    CONSTRAINT PK_Impartidas_codigo_codigo PRIMARY KEY (codigo_asignatura, codigo_aula),
    CONSTRAINT FK_Impartidas_Asignaturas_codigo FOREIGN KEY (codigo_asignatura) REFERENCES Asignaturas (codigo),
    CONSTRAINT FK_Impartidas_Aulas_codigo FOREIGN KEY (codigo_aula) REFERENCES Aulas (codigo)
);