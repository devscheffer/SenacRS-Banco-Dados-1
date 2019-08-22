insert into cliente values ('c1','Super Merco', 'Porto Alegre',
'RS', '3308990','bom',400);
insert into cliente values ('c2','Shop Ltda', 'Canoas',
'RS', null,'otimo',1500);
insert into cliente values ('c3','Cia Limpar', 'Porto Alegre',
'RS', '3328791','medio',800);
insert into cliente values ('c4','Clean Ltda', 'Canoas',
'RS', '4776742','otimo',2300);

insert into produto values (1, 'OMO' ,2.65,'sabão');
insert into produto values (2,'Pinho Sol', 1.34, 'desinfetante');
insert into produto values (3,'Minerva', 1.98, 'sabão');
insert into produto values (4,'Confort', 1.54, 'amaciante');

insert into pedido values ('ped1','13/06/1997','15/06/1997','c2',null);
insert into pedido values ('ped2','15/06/1997','20/07/1997','c1',null);
insert into pedido values ('ped3','15/06/1997','19/07/1997','c4',null);

insert into movimento values('ped1',1,20,53.00);
insert into movimento values('ped1',3,15,29.70);
insert into movimento values('ped1',4,10,15.40);
insert into movimento values('ped2',4,12,18.48);
insert into movimento values('ped2',3,10,19.80);
insert into movimento values('ped3',1,15,39.75);
