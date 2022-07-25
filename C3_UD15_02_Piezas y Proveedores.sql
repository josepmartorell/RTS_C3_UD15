

drop database if exists `C3_UD15_02`;

create database if not exists `C3_UD15_02` /*!40100 DEFAULT CHARACTER SET utf8 */;

use `C3_UD15_02`;

drop table if exists piezas;
drop table if exists suministra;
drop table if exists proveedores;

create table piezas
( 
  Codigo                   int auto_increment,
  Nombre                   nvarchar(100) not null, 
  constraint pk_piezas     primary key (codigo)
);

CREATE TABLE proveedores
( 
  Id               		     char(4),
  Nombre                     nvarchar(100) not null, 
  constraint pk_proveedores  primary key (id)
);

CREATE TABLE suministra
(  
  CodigoPieza               int,
  IdProveedor               char(4),
  Precio				    int,
  constraint foreign key (CodigoPieza) REFERENCES piezas (Codigo) on delete cascade on update cascade,
  constraint foreign key (IdProveedor) REFERENCES proveedores (Id) on delete cascade on update cascade,
  constraint primary key(codigoPieza, idProveedor)
);

insert piezas (Nombre) values
	('Pieza 1'),
    ('Pieza 2'),
    ('Pieza 3'),
    ('Pieza 4'),
    ('Pieza 5'),
    ('Pieza 6'),
    ('Pieza 7'),
    ('Pieza 8'),
    ('Pieza 9'),
    ('Pieza 10');
    
insert proveedores (Id, Nombre) values
	('AB01', 'Proveedor 1'),
    ('AB02', 'Proveedor 2'),
    ('AB03', 'Proveedor 3'),
    ('AB04', 'Proveedor 4'),
    ('AB05', 'Proveedor 5'),
    ('AB06', 'Proveedor 6'),
    ('AB07', 'Proveedor 7'),
    ('AB08', 'Proveedor 8'),
    ('AB09', 'Proveedor 9'),
    ('AB10', 'Proveedor 10');
    
insert suministra (CodigoPieza, IdProveedor, Precio) values
	(1, 'AB01', 10),
    (2, 'AB01', 12),
    (1, 'AB02', 20),
    (3, 'AB05', 8),
    (4, 'AB08', 10),
    (6, 'AB09', 7),
    (7, 'AB07', 17),
    (9, 'AB10', 12),
    (5, 'AB03', 20),
    (10, 'AB04', 10);
    
select * from suministra;
delete from suministra where IdProveedor = 'AB01';
delete from proveedores where Id = 'AB02';
select * from suministra;