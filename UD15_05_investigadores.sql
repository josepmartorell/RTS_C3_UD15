drop database if exists `UD15_5_investigadores`;
create database if not exists `UD15_5_investigadores`;

use `UD15_5_investigadores`;

drop table if exists facultad;
drop table if exists investigadores;
drop table if exists reserva;
drop table if exists equipos;

create table facultad ( 
	Codigo 			 int auto_increment,
    Nombre		     nvarchar(100) not null,
    constraint primary key (Codigo)
);

create table investigadores (
	DNI 			 varchar(8),
    NomApels		 nvarchar(255),
    Facultad         int,
    constraint primary key (DNI),
    constraint foreign key (Facultad) references facultad (Codigo)
);

create table equipos (
	NumSerie 		 char(4),
    Nombre           nvarchar(100),
    Facultad 		 int,
    constraint primary key (NumSerie),
    constraint foreign key (Facultad) references facultad (Codigo)
);

create table reserva (
	DNI 		         varchar(8),
	NumSerie  			 char(4),
	Comienzo			 datetime,
	Fin    				 datetime,
	constraint foreign key (DNI) references investigadores (DNI)
	on delete cascade on update cascade,
	constraint foreign key (NumSerie) references equipos (NumSerie)
	on delete cascade on update cascade,
	primary key (DNI, NumSerie)
);

insert into facultad (Nombre) values ('Universidad de Harvard'),
									 ('Universidad de Oxford'),
									 ('Unbiversidad de Cambridge'),
									 ('Universidad de Berlín'),
									 ('Universidad de Guanajuato'),
									 ('Universidad de Hamburgo'),
									 ('Universidad de Múnich'),
									 ('Universidad de Bonn'),
									 ('Universidad de Friburgo'),
									 ('Universidad de Aquisgrán');
                                      
insert into investigadores (DNI, NomApels, Facultad) values ('0000000A', 'Ernst Müller', 4),
															('1111111R', 'Edelina Shultz', 10),
															('2222222H', 'Erika Bauer', 7),
                                                            ('3333333Q', 'Pacheco Mendoza Moreno', 5),
                                                            ('4444444T', 'Alexander Bonham', 2), 
                                                            ('5555555G', 'Hans Klein', 2),
                                                            ('6666666K', 'Wanda Schwarz', 3),
                                                            ('7777777D', 'Otilia Günther', 3),
                                                            ('8888888P', 'Helmut Kraus', 7), 
                                                            ('9999999F', 'Emma Winter', 7);
                                                            
insert into equipos (NumSerie, Nombre, Facultad) values ('T001','HARVAR_TEAM', 1),
														('T002','OXFORD_TEAM', 2),
														('T003','CAMBRI_TEAM', 3),
														('T004','BERLIN_TEAM', 4),
														('T005','GUANAJ_TEAM', 5),
														('T006','HAMBUR_TEAM', 6),
														('T007','MUNICH_TEAM', 7),
														('T008','DEBONN_TEAM', 8),
														('T009','FRIBUR_TEAM', 9),
														('T010','AQUISG_TEAM', 10);



insert into reserva (DNI, NumSerie, Comienzo, Fin) values ('0000000A', 'T004', '2021-01-07', '2021-07-22'),
														  ('1111111R', 'T010', '2021-03-07', '2021-08-25'), 
														  ('2222222H', 'T007', '2019-03-31', '2021-12-18'), 
														  ('3333333Q', 'T005', '2018-06-23', '2021-07-28'), 
														  ('4444444T', 'T002', '2022-01-07', '2022-05-08'), 
														  ('5555555G', 'T002', '2020-02-12', '2021-07-22'), 
														  ('6666666K', 'T003', '2021-01-07', '2021-07-22'), 
														  ('7777777D', 'T003', '2017-04-09', '2019-03-12'), 
														  ('8888888P', 'T007', '2021-02-19', '2021-04-05'), 
														  ('9999999F', 'T007', '2021-01-18', '2021-11-14'); 

-- test de integridad referencial

DELETE FROM investigadores WHERE DNI='0000000A';

DELETE FROM equipos WHERE NumSerie='T001';

select * from reserva;




