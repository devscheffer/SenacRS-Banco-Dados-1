insert into Xproduto values (1, 'Coca Cola', 'lt', 1.20);
insert into Xproduto values (2, 'Presunto Sadia', 'kg', 5.40);
insert into Xproduto values (3, 'Sabonete Palmolive', 'un', 0.65);
insert into Xproduto values (4, 'Shampoo Colorama', 'un', 2.60);
insert into Xproduto values (5, 'Cerveja Skol', 'gf', 0.99);

insert into Xcliente values (1, 'Joao da Silva', '123456789', 'Rua Andradas, 250');
insert into Xcliente values (2, 'Maria do Rosario', '26547899', 'Rua Lima e Silva, 648');
insert into Xcliente values (3, 'Paulo Silveira', '8963254', 'Rua Plinio Brasil Milano, 980');
insert into Xcliente values (4, 'Rosa Aparecida dos Santos', '5896332123', 'Av Ipiranga, 8960');

insert into Xtipospagamento values (1, 'Cheque');
insert into Xtipospagamento values (2, 'Dinheiro');
insert into Xtipospagamento values (3, 'Crediario');

insert into Xvenda values (1, '20/04/2002', 1, 1, 15.00);
insert into Xvenda values (2, '20/04/2002', 2, 1, 7.50);
insert into Xvenda values (1, '25/04/2002', 3, 2, 7.90);
insert into Xvenda values (1, '30/04/2002', 3, 2, 8.50);

insert into Xitensvenda values (1, '20/04/2002', 1, 1);
insert into Xitensvenda values (1, '20/04/2002', 2, 2);
insert into Xitensvenda values (2, '20/04/2002', 1, 3);
insert into Xitensvenda values (2, '20/04/2002', 2, 2);
insert into Xitensvenda values (2, '20/04/2002', 4, 4);
insert into Xitensvenda values (1, '25/04/2002', 3, 9);
insert into Xitensvenda values (1, '30/04/2002', 3, 7);