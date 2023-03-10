CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(20) UNIQUE NOT NULL,
  "email" varchar(30) UNIQUE NOT NULL,
  "password" varchar(20) UNIQUE NOT NULL,
  "age" int NOT NULL,
  "id_roles" int NOT NULL
);

CREATE TABLE "teacher" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(20) UNIQUE NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(20) UNIQUE NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(20) UNIQUE NOT NULL
);

CREATE TABLE "level" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(20) UNIQUE NOT NULL
);

CREATE TABLE "videos_course" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(20) UNIQUE NOT NULL,
  "url" varchar(30) UNIQUE NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(20) UNIQUE NOT NULL,
  "description" varchar(100) UNIQUE NOT NULL,
  "id_level" int NOT NULL,
  "id_taecher" int NOT NULL,
  "id_user" int NOT NULL,
  "id_categories" int NOT NULL,
  "id_videos" int NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("id_roles") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_categories") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_level") REFERENCES "level" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_taecher") REFERENCES "teacher" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_videos") REFERENCES "videos_course" ("id");









entregable23=# INSERT INTO roles (name) VALUES ('Student');
INSERT 0 1
entregable23=# INSERT INTO roles (name) VALUES ('Teacher');
INSERT 0 1
entregable23=# INSERT INTO roles (name) VALUES ('Admin');
INSERT 0 1
entregable23=# SELECT * FROM roles;
 id |  name
----+---------
  1 | Student
  2 | Teacher
  3 | Admin
(3 filas)


entregable23=# INSERT INTO users (name,email,password,age,id_roles) VALUES ('Juan','juan@gmail.com','123',23,1);
INSERT 0 1
entregable23=# INSERT INTO users (name,email,password,age,id_roles) VALUES ('Maria','maria@gmail.com','456',32,1);
INSERT 0 1
entregable23=# INSERT INTO users (name,email,password,age,id_roles) VALUES ('Fernando','fer@gmail.com','111',45,2);
INSERT 0 1
entregable23=# INSERT INTO users (name,email,password,age,id_roles) VALUES ('Francisco','fran@gmail.com','455',43,3);
INSERT 0 1
entregable23=#
entregable23=# SELECT * FROM users;
 id |   name    |      email      | password | age | id_roles
----+-----------+-----------------+----------+-----+----------
  1 | Juan      | juan@gmail.com  | 123      |  23 |        1
  2 | Maria     | maria@gmail.com | 456      |  32 |        1
  3 | Fernando  | fer@gmail.com   | 111      |  45 |        2
  4 | Francisco | fran@gmail.com  | 455      |  43 |        3
(4 filas)


entregable23=# INSERT INTO level (name) VALUES ('Principiante');
INSERT 0 1
entregable23=# INSERT INTO level (name) VALUES ('Medio');
INSERT 0 1
entregable23=# INSERT INTO level (name) VALUES ('Avanzado');
INSERT 0 1
entregable23=# SELECT * FROM level;
 id |     name
----+--------------
  1 | Principiante
  2 | Medio
  3 | Avanzado
(3 filas)


entregable23=# INSERT INTO categories (name) VALUES ('Dise??o');
INSERT 0 1
entregable23=# INSERT INTO categories (name) VALUES ('Programacion');
INSERT 0 1
entregable23=# INSERT INTO categories (name) VALUES ('Seguridad');
INSERT 0 1
entregable23=# SELECT * FROM categories;
 id |     name
----+--------------
  1 | Dise??o
  2 | Programacion
  3 | Seguridad
(3 filas)


entregable23=# INSERT INTO teacher (name) VALUES ('Harvey');
INSERT 0 1
entregable23=# INSERT INTO teacher (name) VALUES ('Steven');
INSERT 0 1
entregable23=# INSERT INTO teacher (name) VALUES ('Rodrigo');
INSERT 0 1
entregable23=# SELECT * FROM teacher;
 id |  name
----+---------
  1 | Harvey
  2 | Steven
  3 | Rodrigo
(3 filas)


entregable23=# INSERT INTO videos_course (title,url) VALUES ('On 1','https://programacion.com');
INSERT 0 1
entregable23=# INSERT INTO videos_course (title,url) VALUES ('FullsTack Ruby','https://rubyonrails.com');
INSERT 0 1
entregable23=# INSERT INTO videos_course (title,url) VALUES ('HTML','https://html.com');
INSERT 0 1
entregable23=# INSERT INTO videos_course (title,url) VALUES ('Photoshop','https://photoshop.com');
INSERT 0 1
entregable23=# INSERT INTO videos_course (title,url) VALUES ('Ilustrator','https://ilustrator.com');
INSERT 0 1
entregable23=# INSERT INTO videos_course (title,url) VALUES ('Cyberseguridad','https://siberseguridad.com');
INSERT 0 1
entregable23=# SELECT * FROM videos_course;
 id |     title      |            url
----+----------------+----------------------------
  1 | On 1           | https://programacion.com
  2 | FullsTack Ruby | https://rubyonrails.com
  3 | HTML           | https://html.com
  4 | Photoshop      | https://photoshop.com
  5 | Ilustrator     | https://ilustrator.com
  6 | Cyberseguridad | https://siberseguridad.com
(6 filas)


entregable23=# UPDATE videos_course SET title='On 1
entregable23'# UPDATE videos_course SET title='On 1
entregable23-# UPDATE videos_course SET title='On 1' WHERE title=
entregable23-# UPDATE videos_course SET title='On 1' WHERE title='Programacion I';
ERROR:  error de sintaxis en o cerca de ??On??
L??NEA 2: UPDATE videos_course SET title='On 1
                                         ^
entregable23=# UPDATE videos_course SET title='On 1' WHERE title='Programacion I';
UPDATE 0
entregable23=# SELECT * FROM videos_course;
 id |     title      |            url
----+----------------+----------------------------
  1 | On 1           | https://programacion.com
  2 | FullsTack Ruby | https://rubyonrails.com
  3 | HTML           | https://html.com
  4 | Photoshop      | https://photoshop.com
  5 | Ilustrator     | https://ilustrator.com
  6 | Cyberseguridad | https://siberseguridad.com
(6 filas)


entregable23=# UPDATE videos_course SET title='Programacion I' WHERE url = 'https://programacion.com';
UPDATE 1
entregable23=# SELECT * FROM videos_course;
 id |     title      |            url
----+----------------+----------------------------
  2 | FullsTack Ruby | https://rubyonrails.com
  3 | HTML           | https://html.com
  4 | Photoshop      | https://photoshop.com
  5 | Ilustrator     | https://ilustrator.com
  6 | Cyberseguridad | https://siberseguridad.com
  1 | Programacion I | https://programacion.com
(6 filas)


entregable23=# SELECT * FROM courses;
 id | title | description | id_level | id_taecher | id_user | id_categories | id_videos
----+-------+-------------+----------+------------+---------+---------------+-----------
(0 filas)


entregable23=# INSERT INTO courses (title,description,id_level,id_teacher,id_user,id_categories,id_videos) VALUES ('Programacion I','Los fundamentos de ');
ERROR:  no existe la columna ??id_teacher?? en la relaci??n ??courses??
L??NEA 1: INSERT INTO courses (title,description,id_level,id_teacher,i...
                                                         ^
entregable23=# INSERT INTO courses (title,description,id_level,id_teacher,id_user,id_categories,id_videos) VALUES ('Programacion I','los fundamentos de la programacion',1,1,1,2,1);
ERROR:  no existe la columna ??id_teacher?? en la relaci??n ??courses??
L??NEA 1: INSERT INTO courses (title,description,id_level,id_teacher,i...
                                                         ^
entregable23=# INSERT INTO courses (title,description,id_level,id_teacher,id_user,id_categories,id_videos) VALUES ('Programacion I','los fundamentos de la programacion',1,1,1,2,1);
ERROR:  no existe la columna ??id_teacher?? en la relaci??n ??courses??
L??NEA 1: INSERT INTO courses (title,description,id_level,id_teacher,i...
                                                         ^
entregable23=# INSERT INTO courses (title,description,id_level,id_taecher,id_user,id_categories,id_videos) VALUES ('Programacion I','los fundamentos de la programacion',1,1,1,2,1);
INSERT 0 1
entregable23=# INSERT INTO courses (title,description,id_level,id_taecher,id_user,id_categories,id_videos) VALUES ('FullsTack Ruby','Tecnologias del area del usuario y del servidor',3,2,2,2,2);
INSERT 0 1
entregable23=# INSERT INTO courses (title,description,id_level,id_taecher,id_user,id_categories,id_videos) VALUES ('HTML','Estructura de pagina Web',2,3,1,2,3);
INSERT 0 1
entregable23=# INSERT INTO courses (title,description,id_level,id_taecher,id_user,id_categories,id_videos) VALUES ('Photoshop','Fundamento Basico',1,1,2,1,4);
INSERT 0 1
entregable23=# INSERT INTO courses (title,description,id_level,id_taecher,id_user,id_categories,id_videos) VALUES ('Ilustrator','Ilustrator Master',2,2,2,1,5);
INSERT 0 1
entregable23=# INSERT INTO courses (title,description,id_level,id_taecher,id_user,id_categories,id_videos) VALUES ('Cyberseguridad','Seguridad en AWS',3,3,1,3,6);
INSERT 0 1
entregable23=# INSERT INTO courses (title,description,id_level,id_taecher,id_user,id_categories,id_videos) VALUES ('Cyberseguridad','Seguridad en AWS',3,3,1,3,6)
entregable23-# INSERT INTO courses (title,description,id_level,id_taecher,id_user,id_categories,id_videos) VALUES ('Cyberseguridad','Seguridad en AWS',3,3,1,3,6)
entregable23-# INSERT INTO courses (title,description,id_level,id_taecher,id_user,id_categories,id_videos) VALUES ('Cyberseguridad','Seguridad en AWS',3,3,1,3,6sss)
entregable23-# ;
ERROR:  error de sintaxis en o cerca de ??INSERT??
L??NEA 2: INSERT INTO courses (title,description,id_level,id_taecher,i...
         ^
entregable23=# SELECT * FROM courses;
 id |     title      |                   description                   | id_level | id_taecher | id_user | id_categories | id_videos
----+----------------+-------------------------------------------------+----------+------------+---------+---------------+-----------
  1 | Programacion I | los fundamentos de la programacion              |        1 |          1 |       1 |             2 |         1
  2 | FullsTack Ruby | Tecnologias del area del usuario y del servidor |        3 |          2 |       2 |             2 |         2
  3 | HTML           | Estructura de pagina Web                        |        2 |          3 |       1 |             2 |         3
  4 | Photoshop      | Fundamento Basico                               |        1 |          1 |       2 |             1 |         4
  5 | Ilustrator     | Ilustrator Master                               |        2 |          2 |       2 |             1 |         5
  6 | Cyberseguridad | Seguridad en AWS                                |        3 |          3 |       1 |             3 |         6
(6 filas)


entregable23=#
entregable23=# SELECT courses.id, courses.title, users.name FROM courses JOIN users ON users.id = courses.id_user;
 id |     title      | name
----+----------------+-------
  1 | Programacion I | Juan
  2 | FullsTack Ruby | Maria
  3 | HTML           | Juan
  4 | Photoshop      | Maria
  5 | Ilustrator     | Maria
  6 | Cyberseguridad | Juan
(6 filas)


entregable23=# SELECT courses.id, courses.title, users.name FROM courses JOIN users ON users.id = courses.id_user WHERE users.name = 'Maria';
 id |     title      | name
----+----------------+-------
  2 | FullsTack Ruby | Maria
  4 | Photoshop      | Maria
  5 | Ilustrator     | Maria
(3 filas)


entregable23=# SELECT courses.id, courses.title, teacher.name FROM courses JOIN teacher ON teacher.id = courses.id_taecher;
 id |     title      |  name
----+----------------+---------
  1 | Programacion I | Harvey
  2 | FullsTack Ruby | Steven
  3 | HTML           | Rodrigo
  4 | Photoshop      | Harvey
  5 | Ilustrator     | Steven
  6 | Cyberseguridad | Rodrigo
(6 filas)


entregable23=# SELECT courses.id, courses.title, teacher.name FROM courses JOIN teacher ON teacher.id = courses.id_taecher WHERE teacher.name = 'Rodrigo';
 id |     title      |  name
----+----------------+---------
  3 | HTML           | Rodrigo
  6 | Cyberseguridad | Rodrigo
(2 filas)


entregable23=# SELECT courses.id, courses.title,courses.description, teacher.name FROM courses JOIN teacher ON teacher.id = courses.id_taecher WHERE teacher.name = 'Rodrigo';
 id |     title      |       description        |  name
----+----------------+--------------------------+---------
  3 | HTML           | Estructura de pagina Web | Rodrigo
  6 | Cyberseguridad | Seguridad en AWS         | Rodrigo
(2 filas)


entregable23=# SELECT courses.id, courses.title,courses.description, level.name, teacher.name FROM courses JOIN level ON level.id = courses.id_level JOIN teacher ON teacher.id = courses.id_taecher WHERE teacher.name = 'Rodrigo';
 id |     title      |       description        |   name   |  name
----+----------------+--------------------------+----------+---------
  3 | HTML           | Estructura de pagina Web | Medio    | Rodrigo
  6 | Cyberseguridad | Seguridad en AWS         | Avanzado | Rodrigo
(2 filas)


entregable23=# SELECT courses.id, courses.title,courses.description, level.name, users.name, teacher.name FROM courses JOIN level ON level.id = courses.id_level JOIN users ON users.id = courses.id_users JOIN teacher ON teacher.id = courses.id_taecher WHERE teacher.name = 'Rodrigo';
ERROR:  no existe la columna courses.id_users
L??NEA 1: ...el.id = courses.id_level JOIN users ON users.id = courses.id...
                                                              ^
SUGERENCIA:  Probablemente quiera hacer referencia a la columna ??courses.id_user??.
entregable23=# SELECT courses.id, courses.title,courses.description, level.name, users.name, teacher.name FROM courses JOIN level ON level.id = courses.id_level JOIN users ON users.id = courses.id_user JOIN teacher ON teacher.id = courses.id_taecher WHERE teacher.name = 'Rodrigo';
 id |     title      |       description        |   name   | name |  name
----+----------------+--------------------------+----------+------+---------
  3 | HTML           | Estructura de pagina Web | Medio    | Juan | Rodrigo
  6 | Cyberseguridad | Seguridad en AWS         | Avanzado | Juan | Rodrigo
(2 filas)


entregable23=# SELECT courses.id, courses.title,courses.description, level.name, users.name, categories.name, teacher.name FROM courses JOIN level ON level.id = courses.id_level JOIN users ON users.id = courses.id_user JOIN categories ON categories.id = courses.id_categories JOIN teacher ON teacher.id = courses.id_taecher WHERE teacher.name = 'Rodrigo';
 id |     title      |       description        |   name   | name |     name     |  name
----+----------------+--------------------------+----------+------+--------------+---------
  3 | HTML           | Estructura de pagina Web | Medio    | Juan | Programacion | Rodrigo
  6 | Cyberseguridad | Seguridad en AWS         | Avanzado | Juan | Seguridad    | Rodrigo
(2 filas)


entregable23=# SELECT courses.id, courses.title,courses.description, level.name, users.name, categories.name, videos_course.title, videos_course.url, teacher.name FROM courses JOIN level ON level.id = courses.id_level JOIN users ON users.id = courses.id_user JOIN categories ON categories.id = courses.id_categories JOIN videos_course ON videos_course.id = courses.id_videos JOIN teacher ON teacher.id = courses.id_taecher WHERE teacher.name = 'Rodrigo';
 id |     title      |       description        |   name   | name |     name     |     title      |            url             |  name
----+----------------+--------------------------+----------+------+--------------+----------------+----------------------------+---------
  3 | HTML           | Estructura de pagina Web | Medio    | Juan | Programacion | HTML           | https://html.com           | Rodrigo
  6 | Cyberseguridad | Seguridad en AWS         | Avanzado | Juan | Seguridad    | Cyberseguridad | https://siberseguridad.com | Rodrigo
(2 filas)


entregable23=# SELECT courses.id, courses.title,courses.description, level.name, users.name, categories.name, videos_course.title, videos_course.url, teacher.name FROM courses JOIN level ON level.id = courses.id_level JOIN users ON users.id = courses.id_user JOIN categories ON categories.id = courses.id_categories JOIN videos_course ON videos_course.id = courses.id_videos JOIN teacher ON teacher.id = courses.id_taecher;
 id |     title      |                   description                   |     name     | name  |     name     |     title      |            url             |  name
----+----------------+-------------------------------------------------+--------------+-------+--------------+----------------+----------------------------+---------
  1 | Programacion I | los fundamentos de la programacion              | Principiante | Juan  | Programacion | Programacion I | https://programacion.com   | Harvey
  2 | FullsTack Ruby | Tecnologias del area del usuario y del servidor | Avanzado     | Maria | Programacion | FullsTack Ruby | https://rubyonrails.com    | Steven
  3 | HTML           | Estructura de pagina Web                        | Medio        | Juan  | Programacion | HTML           | https://html.com           | Rodrigo
  4 | Photoshop      | Fundamento Basico                               | Principiante | Maria | Dise??o       | Photoshop      | https://photoshop.com      | Harvey
  5 | Ilustrator     | Ilustrator Master                               | Medio        | Maria | Dise??o       | Ilustrator     | https://ilustrator.com     | Steven
  6 | Cyberseguridad | Seguridad en AWS                                | Avanzado     | Juan  | Seguridad    | Cyberseguridad | https://siberseguridad.com | Rodrigo
(6 filas)


entregable23=#

