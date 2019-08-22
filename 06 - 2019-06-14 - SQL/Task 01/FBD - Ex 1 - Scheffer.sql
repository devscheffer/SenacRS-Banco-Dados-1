-- + 1) Mostre o nome de todos os clientes

select 
	nome
 from 
 	cliente

-- + 2) Mostre o nome do cliente , status e sua cidade

select 
	nome,
	status,
	cidade
 from 
 	cliente
 
-- + 3) Mostre o nome do cliente , status e sua cidade, para clientes com status diferente de “bom”

select 
	nome,
	status,
	cidade
 from 
 	cliente
 where 
 	status != 'bom'
 
-- + 4) Mostre o nome dos clientes que fizeram pelo menos um pedido

select 
	cliente.nome, 
	pedido.nro_ped
 from 
 	cliente,
	pedido
 where 
 	cliente.cod_cli = pedido.cod_cli
 
-- + 5) Mostre o nome dos clientes e nome dos produtos os quais fizeram pedidos com qtd > 10 e < 20

select 
	cliente.nome, 
	produto.nome, 
	movimento.qtde
 from 
 	cliente, 
	pedido, 
	movimento,
	produto
 where 
 	cliente.cod_cli = pedido.cod_cli
  and pedido.nro_ped = movimento.nro_ped
  and movimento.cod_prod = produto.cod_prod
  and qtde > 10
  and qtde < 20;
	   
-- + 6) Mostre o nome dos produtos os quais nunca foram pedidos.

select 
	cod_prod, 
	nome  
 from 
 	produto 
except
select 
	movimento.cod_prod, 
	produto.nome 
 from 
 	movimento, 
	pedido, 
	produto
 where 
 	movimento.nro_ped = pedido.nro_ped
  and movimento.cod_prod = produto.cod_prod
	   
-- + 7) Mostre, sem repetição, o nome dos clientes os quais fizeram pedidos com quantidade maior que 1.

select distinct 
	cliente.nome
 from 
 	cliente,
	pedido,
	movimento
 where 
 	cliente.cod_cli = pedido.cod_cli
  and pedido.nro_ped = movimento.nro_ped
  and qtde > 1
	   
-- + 8) Mostre o nome dos produtos feitos pelo pedido ped2.

select 
	pedido.nro_ped, 
	produto.nome
 from 
	 pedido,
	 movimento,
	 produto
 where 
 	pedido.nro_ped = movimento.nro_ped
  and movimento.cod_prod = produto.cod_prod
  and pedido.nro_ped = 'ped2'
 
 