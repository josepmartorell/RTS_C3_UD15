drop database if exists `C3_UD15_04`;
create database if not exists `C3_UD15_04`;

use `C3_UD15_04`;

drop table if exists cajeros;
drop table if exists productos;
drop table if exists maquinas_registradoras;
drop table if exists venta;

create table cajeros ( 
	Codigo 			 int auto_increment,
    NomApels		 nvarchar(255) not null,
    constraint primary key (Codigo)
);

create table productos (
	Codigo 			 int auto_increment,
    Nombre		     nvarchar(100),
    Precio		     int,
    constraint primary key (Codigo)
);

create table maquinas_registradoras (
	Codigo 			 int auto_increment,
    piso 		     int,
    constraint primary key (Codigo)
);

create table ventas (
	Cajero			     int,
	Maquina   			 int,
	Producto			 int,
	constraint foreign key (Cajero) references cajeros (Codigo) on delete cascade on update cascade,
	constraint foreign key (Maquina) references maquinas_registradoras (Codigo) on delete cascade on update cascade,
	constraint foreign key (Producto) references productos (Codigo) on delete cascade on update cascade,
	primary key (Cajero, Maquina, Producto)
);

insert cajeros (NomApels) values
	('Roger Rubio'),
    ('Josep Martorell'),
    ('Joel Romero'),
    ('Maria Rosa'),
    ('Francisco Garcia'),
    ('Andreu Ferrando'),
    ('Pilar Perez'),
    ('Juana Pastor'),
    ('Pepe Grillo'),
    ('Peter Parker');

insert productos (Nombre, Precio) values
	('Manzanas', 2),
    ('Ventilador', 30),
    ('Helados', 3),
    ('Hielo', 1),
    ('Refresco', 2),
    ('Agua', 1),
    ('Zumo', 3),
    ('Peras', 2),
    ('Platanos', 2),
    ('Sandia', 300);

insert maquinas_registradoras (piso) values
	(1), (1), (1), (1), (1), (2), (2), (2), (3), (3);
    
insert ventas (Cajero, Maquina, Producto) values
	(1, 1, 1),
    (2, 2, 4),
    (2, 3, 5),
    (4, 4, 6),
    (5, 6, 2),
    (2, 5, 6),
    (7, 8, 8),
    (5, 6, 3),
    (8, 9, 5),
    (3, 4, 2);
    
select * from ventas;
delete from productos where Codigo = 1;
delete from cajeros where Codigo = 1;
select * from ventas;