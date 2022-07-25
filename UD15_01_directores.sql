drop database if exists UD15_01_directores;
create database UD15_01_directores;
use UD15_01_directores;

create table Despachos (
	numero 				int auto_increment,
    capacidad 			int null,
    primary key (numero)
);

create table Directores (
	dni 				varchar(8) not null,
    nomApels			nvarchar(255) not null,
    despacho 		    int,
    primary key(dni),
    foreign key (despacho) references Despachos(numero)
    on delete set null on update cascade
);

alter table Directores
	add column dniJefe 	 		varchar(8),
    add foreign key (dniJefe) 	references Directores (dni)
    on delete set null on update cascade;
    
insert into Despachos (capacidad) values(3), 
										(5), 
                                        (16), 
                                        (7), 
                                        (4),
                                        (11), 
                                        (5), 
                                        (6), 
                                        (13), 
                                        (8);

insert into Directores (dni, nomApels, despacho, dniJefe) values('1111111A', 'Jose Montilla Barbero', 3, null), 
																('2222222B', 'Juana Robledo Díaz', 3, '1111111A'), 
																('3333333C', 'Feliu Ripoll Angera', 1, '1111111A'),
																('4444444D', 'Manuela Martíez Rebolledo', 1, '1111111A'), 
																('5555555E', 'Perico Baz Merovingio', 1, '1111111A'), 
																('6666666F', 'Aida Sastre Bonilla', 7, '1111111A'), 
																('7777777G', 'Pedro Guzmán Sobrio', 1, null),
																('8888888H', 'Aroa Gutierrez Sobrado', 5, null), 
																('9999999I', 'Camila Doblado Carrillo', 1, null), 
																('0000000J', 'Esther Miranda Boñuelo', 1, null);

commit;    
    
-- test de integridad referencial

DELETE FROM Despachos WHERE numero= 1;

DELETE FROM Directores WHERE DNI='1111111A';

select * from Directores;