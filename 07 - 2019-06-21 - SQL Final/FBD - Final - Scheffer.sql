-- + 1 – Selecionar a descrição, unidade dos produtos e o preço com acréscimo de 7,5%.

select 
	descricaoproduto, 
	unidade, 
	preco,
	round(cast(preco*(1.075) as numeric ),2)
	 as "Valor Corrigido"
 from xproduto

-- + 2 – Selecionar o código, a descrição do produto e a unidade para os produtos com preço inferior a R$ 2,50 ou a unidade = kg.

select 
	codproduto,
	descricaoproduto,
	unidade,
	preco
 from 
 	xproduto
 where 
 	preco < 2.5
  or unidade = 'kg'

-- + 3 – Selecionar o código e descrição dos produtos com preço entre R$ 1,00 e R$ 3,00.

select 
	codproduto,
	descricaoproduto,
	preco
 from 
 	xproduto
 where 
 	preco >= 1
  and preco <= 3

-- + 4 – Selecionar o nome dos clientes que possuem 2 letras “a” no nome.

select 
	cliente
 from 
 	xcliente
 where 
 	cliente
	 like '%a%a%'
 
-- + 5 – Selecionar o número da venda e data da venda para as vendas com valor inferior a R$ 8,00 ou que foram realizadas no dia 30/04/2002.
SET datestyle = dmy
select 
	nnf, 
	dtvenda, 
	vlvenda
 from 
 	xvenda
 where 
 	vlvenda < 8
  or dtvenda = '30/04/2002'
 
-- + 6 - Selecionar o número da venda e data da venda para as vendas onde a quantidade de produto vendido for 1, 2, 4 ou 7. Não repetir os dados.

select distinct 
	nnf, 
	dtvenda
 from 
 	xitensvenda
 where 
 	qtde = 1
  or qtde = 2
  or qtde = 4
  or qtde = 7
 
-- + 7 – Selecionar o número e data da venda que não utilizou o tipo de pagamento 2.

select 
	xvenda.nnf, 
	xvenda.dtvenda, 
	xvenda.codtppagamento, 
	xtipospagamento.descricaotppagamento
 from 
 	xvenda,
	xtipospagamento
 where 
 	xvenda.codtppagamento = xtipospagamento.codtppagamento
  and xvenda.codtppagamento != 2
  
-- + 8 – Selecionar o número e a data da venda para as vendas que ocorreram entre as datas 20/04/2002 e 25/04/2002.

select 
	nnf, 
	dtvenda
 from 
 	xvenda
 where 
 	dtvenda >= '20/04/2002'
  and dtvenda <= '25/04/2002'
 
-- + 9 – Selecionar o número da venda e data da venda feita pelo cliente 3 e com valor superior a R$ 8,00.

select 
	xvenda.nnf, 
	xvenda.dtvenda, 
	xvenda.vlvenda,
	xvenda.codcliente, 
	xcliente.cliente
 from 
 	xvenda, 
	xcliente
 where 
 	xvenda.codcliente = xcliente.codcliente
  and xcliente.codcliente = 3
  and vlvenda > 8
 
 
-- + 10 – Selecionar a descrição da forma de pagamento que termina com a letra “o”.

select 
	descricaotppagamento
 from 
 	xtipospagamento
 where 
 	descricaotppagamento 
	 like '%o'
