-- + 1) Mostre o total de produtos cadastrados

select 
	count(nome)
 from 
 	produto
 
-- + 2) Mostre a quantidade de pedidos feitos pelo cliente c1

select 
	cliente.cod_cli, 
	sum(movimento.qtde)
 from 
 	cliente, 
	pedido, 
	movimento
 where 
 	cliente.cod_cli = pedido.cod_cli 
  and pedido.nro_ped = movimento.nro_ped
  and cliente.cod_cli = 'c1'
 group by 
 	cliente.cod_cli
 
-- + 3) Mostre a quantidade de clientes por estado

select 
	uf, 
	count(cod_cli)
 from 
 	cliente
 group by 
 	uf

-- + 4) Mostre a quantidade total pedida por produto, que seja superior a 34

select 
	nome, 
	sum(movimento.qtde)
 from 
 	produto, 
	movimento, 
	pedido
 where 
 	produto.cod_prod = movimento.cod_prod
  and movimento.nro_ped = pedido.nro_ped
 group by 
 	nome
 having 
 	sum(qtde) > 34
  
-- + 5) Mostre a quantidade de clientes, por cidade, os quais fizeram algum pedido

select 
	cliente.cidade,
	count(distinct cliente.nome)
 from 
	 cliente, 
	 movimento, 
	 pedido
 where 
 	cliente.cod_cli = pedido.cod_cli
  and pedido.nro_ped = movimento.nro_ped
 group by 
 	cidade