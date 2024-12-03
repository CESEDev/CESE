CREATE DATABASE UniversidadXYZ;

USE UniversidadXYZ;

-- Tabla de alumnos
CREATE TABLE alumnos (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    matricula VARCHAR(15) UNIQUE NOT NULL,
    correo VARCHAR(100) NOT NULL,
    carrera VARCHAR(100) NOT NULL
);

-- Tabla de horarios
CREATE TABLE horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    materia VARCHAR(100),
    profesor VARCHAR(100),
    horario VARCHAR(50),
    aula VARCHAR(20),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno) ON DELETE CASCADE
);

-- Tabla de calificaciones
CREATE TABLE calificaciones (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    materia VARCHAR(100),
    calificacion DECIMAL(4, 2),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno) ON DELETE CASCADE
);

-- Tabla de certificaciones
CREATE TABLE certificaciones (
    id_certificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    nombre_certificacion VARCHAR(100),
    estado VARCHAR(50) DEFAULT 'En proceso',
    fecha_obtencion DATE DEFAULT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno) ON DELETE CASCADE
);
-- Crear tabla de administradores
CREATE TABLE administradores (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL
);

-- Insertar un administrador (contrasena debe estar en formato hash)
INSERT INTO administradores (usuario, contrasena) VALUES ('admin', 'hashed_password');
