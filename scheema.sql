CREATE  USER 'AbrilMosquera'@'%' IDENTIFIED BY 'abril17';
GRANT ALL PRIVILEGES ON chefencasa.* TO 'AbrilMosquera'@'%';
SHOW DATABASES;

USE chefencasa;

CREATE TABLE usuario(
   id INT  PRIMARY KEY AUTO_INCREMENT,
   user VARCHAR(50),
   contrasenia VARCHAR(50),
   email VARCHAR(50),
   idioma VARCHAR(50),
   pais_id INT,
   FOREIGN KEY (pais_id) REFERENCES pais(id)
)

CREATE TABLE pais(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE
)

CREATE TABLE coccion(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
)

CREATE TABLE dietas (
	nombre_de_recetas VARCHAR(50),
	id INT PRIMARY KEY AUTO_INCREMENT
)

CREATE TABLE momentos_dias (
    momentos_del_dias VARCHAR(50),
    id INT PRIMARY KEY AUTO_INCREMENT
)

ALTER TABLE momentos_dias
ADD COLUMN descripcion VARCHAR(100);

CREATE TABLE ingredientes (
   ID INT PRIMARY KEY AUTO_INCREMENT,
   tipo_de_ingrediente VARCHAR(50)
)

CREATE TABLE recetas(
    cantidad_de_personas INT,
    paso_a_paso TEXT,
    tipo_de_dificultad INT,
    id INT PRIMARY KEY AUTO_INCREMENT,
    pais_id INT,
    user_id INT,
    
    FOREIGN KEY (pais_id) REFERENCES pais(id),
    FOREIGN KEY (user_id) REFERENCES usuario(id),
)
    

CREATE TABLE recetas_por_dieta(
    receta_id INT,
    dieta_id INT,
    PRIMARY KEY (receta_id,dieta_id),
    FOREIGN KEY (dieta_id) REFERENCES dietas(id),
    FOREIGN KEY (receta_id) REFERENCES recetas(id)
)

CREATE TABLE recetas_por_momento_de_dia(
    receta_id INT,
    momentoDia_id INT,
    PRIMARY KEY (receta_id,momentoDia_id),
    FOREIGN KEY (momentoDia_id) REFERENCES momentos_dias(id),
    FOREIGN KEY (receta_id) REFERENCES recetas(id)
);

CREATE TABLE recetas_ingredientes(
    receta_id INT,
    ingredientes_id INT,
    PRIMARY KEY (receta_id,ingredientes_id),
    FOREIGN KEY (ingredientes_id) REFERENCES ingredientes(id),
    FOREIGN KEY (receta_id) REFERENCES recetas(id)

)

CREATE TABLE recetas_cocciones (
    receta_id INT,
    cocciones_id INT,
    PRIMARY KEY (receta_id,cocciones_id),
    FOREIGN KEY (cocciones_id) REFERENCES coccion(id),
    FOREIGN KEY (receta_id) REFERENCES recetas(id), 
)


CREATE TABLE medidas (
    id INT PRIMARY KEY,
    recetas VARCHAR(50),
    recetas_id INT,
    FOREIGN KEY (recetas_id) REFERENCES recetas(id)
)

CREATE TABLE rec_ing(
    id  INT PRIMARY KEY AUTO_INCREMENT,
    recetas_id INT,
    ingredientes_id INT,
    FOREIGN KEY (recetas_id) REFERENCES recetas(id),
    FOREIGN KEY (ingredientes_id) REFERENCES ingredientes(ID)
)

DROP TABLE momentos_dias;
DESCRIBE pais;
SHOW TABLES;

<<<<<<< HEAD
/* inserte los datos en la tabla de momentos del dia*/
INSERT INTO momentos_dias (momentos_del_dias, descripcion) VALUES
('desayuno', 'Primera comida del día, generalmente por la mañana.'),
('almuerzo', 'Comida principal del día, normalmente al mediodía.'),
('cena', 'Comida que se toma por la noche.'),
('postre', 'Plato dulce que se sirve después de la comida.'),
('snacks', 'Comidas ligeras entre las comidas principales.'),
('merienda', 'Comida ligera que se toma entre la tarde y la cena.');
=======
INSERT INTO usuario (user,email, contrasenia, idioma)
VALUES ('adhara','adhara@gmail.com','111','Español'),
       ('jorge','jorge@gmail.com','777','Ingles'),
       ('rosa','rosa@gmail.com','222','Español');




INSERT INTO rec_ing (recetas_id, ingredientes_id, medidas_id) 
VALUES (6, 9, 3), (7, 2, 2), (8, 3, 1);

UPDATE usuario
SET contrasenia = '123'
WHERE id = '4';

DELETE FROM usuario
WHERE id = '5';

INSERT INTO dietas (nombre_de_recetas)
VALUES ('Vegana'),
       ('Fitness'),
       ('Sin T.A.C.C');


UPDATE dietas
SET nombre_de_recetas = 'Vegetariana'
WHERE id = '1';

DELETE FROM dietas
WHERE id = '2';

DELETE FROM dietas
WHERE id = '3';

DELETE FROM dietas
WHERE id = '4';


INSERT INTO pais (nombre) VALUES ("Argentina"),("Brasil"),("Colombia");


UPDATE pais SET nombre = "brasil " WHERE nombre = "Brasil";

DELETE FROM pais WHERE nombre = "Colombia";

<<<<<<< HEAD
=======
SELECT DISTINCT nombre from pais;
DELETE FROM pais WHERE nombre = "brasil";
DELETE FROM pais WHERE id = 10;

ALTER TABLE pais ADD CONSTRAINT unique_nombre UNIQUE (nombre);
=======
>>>>>>> 2336061588d6d4aa9bccebe724f23bd7bf8ae943

INSERT INTO (nombre)
VALUES ("plancha"),
   	("horno"),
   	("hervido"),
   	("freidora de aire"),
   	("frito"),
   	("microondas"),
   	("parrilla"),
   	("sin cocina");

UPDATE coccion
SET nombre = "batido"
WHERE id = 5;

DELETE FROM coccion
WHERE id = 6;
<<<<<<< HEAD

=======
<<<<<<< HEAD

//sf
//ingredientes
INSERT INTO ingredientes (tipo_de_ingredientes)
 VALUES  ('Verduras'),
                 ( 'Carnes'),
                 ( 'Lácteos');


SELECT * FROM ingredientes;


UPDATE ingredientes
SET tipo_de_ingredientes = 'Frutas'
WHERE ID = 1;


DELETE FROM ingredientes
WHERE ID = 2;
//sf
//medidas
INSERT INTO medidas (recetas) 
VALUES ('Receta 1'); 

INSERT INTO medidas (recetas) 
VALUES ('Receta 2'); 

INSERT INTO medidas (recetas) 
VALUES ( 'Receta 3');


SELECT * FROM medidas;


UPDATE medidas SET recetas = 'Receta Actualizada' WHERE id = 1;

DELETE FROM medidas WHERE id = 2;

ALTER TABLE medidas DROP FOREIGN KEY medidas_ibfk_1; 

ALTER TABLE nombre_tabla
DROP COLUMN columna;
--elimine foreing key
ALTER TABLE rec_ing
DROP FOREIGN KEY fk_medidas_id;
--referencie la foreing key nuevamente
ALTER TABLE rec_ing
ADD CONSTRAINT medidas_id
FOREIGN KEY (medidas_id) REFERENCES medidas(id);

ALTER TABLE recetas
CHANGE COLUMN cantidad_de_personas porciones int;

ALTER TABLE medidas
CHANGE COLUMN recetas medidas VARCHAR(50) ;

INSERT INTO dificultades (tipo_de_dificultad)
VALUES ('Facil'),
       ('Medio'),
       ('Dificl');

//
=======
>>>>>>> 47f91ba62ff0bb6a7681acf6347918f073f36161
>>>>>>> c6deac25d17fd2962adaea4dc39022b00357fab6
>>>>>>> b5a77dab93a7c4b9f7495e7dd33e53a047a2883b
>>>>>>> e619c37bdf74630427c7df9025049295fa68edc2
>>>>>>> 2336061588d6d4aa9bccebe724f23bd7bf8ae943


UPDATE usuario
SET pais_id = 1
WHERE id = 1;

UPDATE usuario
SET pais_id = 13
WHERE id = 3;

UPDATE usuario
SET pais_id = 2
WHERE id = 4;

UPDATE usuario
SET pais_id = 1
WHERE id = 6;


UPDATE usuario
SET pais_id = 14
WHERE id = 2;

INSERT INTO pais (nombre) 
VALUES ("Inglaterra")

INSERT INTO medidas(medidas)
VALUES("kilogramos"),
	   ("gramos"), 
       ("litros"),
       ("mililitros"),
       ("miligramos");

DELETE FROM ingredientes WHERE tipo_de_ingrediente = 'Carnes';

INSERT INTO ingredientes (tipo_de_ingrediente)
VALUES ('Fideo'),
    	('Pollo'),
    	('Tomate'),
    	('Cebolla');
       

INSERT INTO recetas_por_momento_de_dia (receta_id,momentoDia_id)
VALUES (8,1),
       (6,2),
       (7,3),
       (8,4),
       (8,5),
       (8,6);
       
INSERT INTO ingredientes (tipo_de_ingrediente)
VALUES  ('Azucar'),
        ('Aceite'),
         ('Leche'),
        ('Harina Leudante'),
        ('Esencia de Vainilla'),
        ('Pimienta'),
        ('Sal'),
        ('Manteca'),
        ('Carne'),
        ('Orégano'),
        ('Comino'),
        ('Queso Rallado'),
        ('Pimentón'),
        ('Salchicha'),
        ('Ajo'),
        ('Caldo de Verduras'),
        ('Fideos'),
        ('Albahaca')
        ;

/*modifique los datos de la tabla de recetas  */
UPDATE recetas
SET paso_a_paso = '1.	Preparar la mezcla: En una licuadora o procesador de alimentos, agrega la avena, la leche, los huevos, banana (si lo usas), el polvo de hornear, la canela, la esencia de vainilla y la sal. Licúa hasta obtener una mezcla suave y homogénea. Si está muy espesa, puedes añadir un poco más de leche para obtener la consistencia deseada.
	2.	Cocinar los hotcakes: Calienta una sartén antiadherente a fuego medio y añade un poco de aceite de coco o mantequilla. Vierte la mezcla en la sartén en pequeñas porciones (aproximadamente 2-3 cucharadas de mezcla por hotcake). Cocina durante 2-3 minutos, hasta que aparezcan burbujas en la superficie, luego voltea con cuidado y cocina durante otro minuto o hasta que estén dorados.
	3.	Servir: Sirve los hotcakes calientes, agregando las frutas frescas encima o dentro de la mezcla antes de cocinar, y si deseas, acompáñalos con miel, o yogur griego.'
WHERE id = 8;

<<<<<<< HEAD
UPDATE recetas
SET rec_ing = 6
WHERE ingredientes_id = 9;

UPDATE recetas
SET rec_ing = 7
WHERE ingredientes_id = 2;

UPDATE recetas
SET rec_ing = 7
WHERE ingredientes_id = 3;
=======




UPDATE ingredientes
SET id = 7
WHERE id = 14;

UPDATE ingredientes
SET id = 8
WHERE id = 15;

UPDATE ingredientes
SET id = 9
WHERE id = 16;

UPDATE ingredientes
SET id = 10
WHERE id = 17;

UPDATE ingredientes
SET id = 11
WHERE id = 18;

UPDATE ingredientes
SET id = 12
WHERE id = 19;

UPDATE ingredientes
SET id = 13
WHERE id = 20;

UPDATE ingredientes
SET id = 14
WHERE id = 21;

UPDATE ingredientes
SET id = 15
WHERE id = 22;

UPDATE ingredientes
SET id = 16
WHERE id = 23;

UPDATE ingredientes
SET id = 17
WHERE id = 24;

UPDATE ingredientes
SET id = 18
WHERE id = 25;

UPDATE ingredientes
SET id = 19
WHERE id = 26;

UPDATE ingredientes
SET id = 20
WHERE id = 27;

UPDATE ingredientes
SET id = 21
WHERE id = 28;

UPDATE ingredientes
SET id = 22
WHERE id = 29;

UPDATE ingredientes
SET id = 23
WHERE id = 30;

UPDATE ingredientes
SET id = 24
WHERE id = 31;

