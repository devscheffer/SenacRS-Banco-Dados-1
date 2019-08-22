create  table produto
(cod_prod integer not null,
nome char(30) not null,
preco  float not null,
categoria char(20) not null,
primary key (cod_prod));


create table cliente
(cod_cli char(10) not null,
nome char(40) not null,
cidade char(20) not null,
uf char(2) not null,
telefone char(20),
status char(05) not null,
limite float not null,
primary key (cod_cli));


create table pedido
(nro_ped char(10) not null,
data_elab date not null,
data_ent date,
cod_cli char(10) not null,
primary key (nro_ped),
foreign key (cod_cli) references cliente);

create table movimento
(nro_ped char(10) not null,
cod_prod integer not null,
qtde integer not null,
total_mov float not null,
primary key (nro_ped, cod_prod),
foreign key (nro_ped) references pedido,
foreign key (cod_prod) references produto);

alter table pedido add total_ped float;

create  index Ch_Pr_Mov on movimento 
(qtde);