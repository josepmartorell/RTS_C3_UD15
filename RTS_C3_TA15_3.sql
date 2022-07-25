drop database if exists `C3_UD15_3`;
create database if not exists `C3_UD15_3`;

use `C3_UD15_3`;

drop table if exists Cientificos;
drop table if exists Asignados_a;
drop table if exists Proyectos;


create table Cientificos ( 
	dni 			 varchar(8),
    nomApels		 nvarchar(255) not null,
    
    CONSTRAINT PRIMARY KEY (DNI)
);


create table Proyectos (
	id    		     char(4),
    nombre		     nvarchar(255),
    horas 		     int,
    
    CONSTRAINT PRIMARY KEY (id)
);


create table Asignados_a (
	id                   int auto_increment,
	cientifico			 varchar(8),
	proyecto   			 char(4),

	CONSTRAINT FOREIGN KEY (cientifico) references Cientificos(dni) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (proyecto) references Proyectos(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT PRIMARY KEY (id)
);


INSERT INTO Cientificos(dni, nomApels) VALUES (11111111, 'Pepito Grillo'), 
											  (22222222, 'Grillo Pepito'),
											  (33333333, 'Pepo Saltamontes'),
											  (44444444, 'Noseme Ocurre'),
											  (55555555, 'Aitor Menta'),
											  (66666666, 'Pistacho Furioso'),
											  (77777777, 'Eustaquio Languidente'),
											  (88888888, 'Legumbre Verdolera'),
											  (99999999, 'John Smith'),
											  (10101010, 'Casimiro Ojoardiente');


INSERT INTO Proyectos(id, nombre, horas) VALUES (1, 'Vida Infinita', 30000),
										        (2, 'Project X', 4),
												(3, 'Proyecto alpha', 6),
												(4, 'Proyecto gamma', 800),
												(5, 'Proyecto beta', 500),
												(6, 'Proyecto delta', 60),
												(7, 'Proyecto omicron', 80),
												(8, 'Proyecto epsilon', 90),
												(9, 'Proyecto theta', 100),
												(10, 'Proyecto final', 150);
                                            

INSERT INTO Asignados_a(cientifico, proyecto) VALUES (11111111,1),
													 (22222222,2),
                                                     (33333333,3),
                                                     (44444444,4),
                                                     (55555555,5),
                                                     (66666666,6),
                                                     (77777777,7),
                                                     (88888888,8),
                                                     (99999999,10),
                                                     (10101010,10);
                                                     
# Start status
SELECT * FROM Proyectos;

# Change of first scientific to the last project
REPLACE INTO Asignados_a(cientifico, proyecto) VALUES (11111111,10);

# half of the hours of the second project
UPDATE Proyectos SET horas=horas/2 WHERE id='2';

# delete of the eigth project
DELETE FROM Proyectos WHERE id=8;

# We check the changes again in Proyectos and Asignados_a
SELECT * FROM Asignados_a;
SELECT * FROM Proyectos;