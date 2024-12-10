--Creación de Base de Datos
CREATE DATABASE db_biblioteca;

-- Tabla "autores"
CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

-- Tabla "libros"
CREATE TABLE libros (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_autor INT REFERENCES autores(id_autor), -- Relación con la tabla "autores"
    genero VARCHAR(50),
    anio_publicacion INT
);


-- Datos para la tabla "autores"
INSERT INTO autores (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiano'),
('Antoine de Saint-Exupéry', 'Francés'),
('Miguel de Cervantes', 'Español'),
('J.R.R. Tolkien', 'Británico'),
('J.K. Rowling', 'Británica'),
('Fiódor Dostoyevski', 'Ruso'),
('Jane Austen', 'Británica'),
('George Orwell', 'Británico'),
('Harper Lee', 'Estadounidense'),
('Umberto Eco', 'Italiano');

-- Datos para la tabla "libros"
INSERT INTO libros (titulo, id_autor, genero, anio_publicacion) VALUES
('Cien años de soledad', 1, 'Novela', 1967),
('El principito', 2, 'Cuento', 1943),
('Don Quijote de la Mancha', 3, 'Novela', 1605),
('El señor de los anillos', 4, 'Fantasía', 1954),
('Harry Potter y la piedra filosofal', 5, 'Fantasía', 1997),
('Crimen y castigo', 6, 'Novela', 1866),
('Orgullo y prejuicio', 7, 'Novela', 1813),
('1984', 8, 'Novela', 1949),
('Matar a un ruiseñor', 9, 'Novela', 1960),
('El nombre de la rosa', 10, 'Novela', 1980);

select *from autores;

select *from libros;

-- Consulta 1: Seleccionar los 5 primeros autores
SELECT id_autor, nombre, nacionalidad
FROM autores
LIMIT 5;

-- Consulta 2: Seleccionar los 5 libros más recientes
SELECT id_libro, titulo, anio_publicacion
FROM libros
ORDER BY anio_publicacion DESC
LIMIT 5;

-- Consulta 3: Seleccionar los 5 primeros libros con el nombre de su autor
SELECT libros.titulo, autores.nombre
FROM libros
JOIN autores ON libros.id_autor = autores.id_autor
LIMIT 5;




