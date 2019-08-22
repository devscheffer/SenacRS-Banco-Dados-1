create table Xproduto (
			codproduto integer not null,
			descricaoproduto varchar(50) not null,
			unidade char(2) not null,
			preco float not null,
			primary key(codproduto));

create table Xcliente (
			codcliente integer not null,
			cliente varchar(50) not null,
			cpf varchar(11) not null,
			endereco char(30) not null,
			primary key(codcliente));

create table Xtipospagamento (
			codtppagamento integer not null,
			descricaotppagamento varchar(20) not null,
			primary key (codtppagamento));

create table Xvenda (
			nnf integer not null,
			dtvenda date not null,
			codcliente integer not null,
			codtppagamento integer not null,
			vlvenda float not null,
			primary key (nnf,dtvenda),
			foreign key (codcliente) references Xcliente,
			foreign key (codtppagamento) references Xtipospagamento);

create table Xitensvenda (
			nnf integer not null,
			dtvenda date not null,
			codproduto integer not null,
			qtde float not null,
			primary key (nnf, dtvenda,codproduto));