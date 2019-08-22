-- + 1 – Selecionar o nome do cliente e quantidade de produtos comprados, somente para clientes que compraram Coca Cola.

select distinct
 xcliente.cliente, 
 xitensvenda.qtde, 
 xproduto.descricaoproduto
 from 
  xcliente, 
  xvenda, 
  xitensvenda, 
  xproduto
 where 
  xcliente.codcliente = xvenda.codcliente
  and xvenda.nnf = xitensvenda.nnf
  and xitensvenda.codproduto = xproduto.codproduto
  and xproduto.descricaoproduto = 'Coca Cola'
 
-- + 2 – Selecionar o nome do cliente e o valor total comprado por ele.

select 
 xcliente.cliente, 
 sum(xvenda.vlvenda)
 from 
  xcliente, 
  xvenda, 
  xitensvenda, 
  xproduto
 where 
  xcliente.codcliente = xvenda.codcliente
  and xvenda.nnf = xitensvenda.nnf
  and xitensvenda.codproduto = xproduto.codproduto
 group by 
  xcliente.cliente
  
-- + 3 – Selecionar a descrição e o maior preço de produto vendido.

select 
 xproduto.descricaoproduto, 
 max(xproduto.preco)
 from 
  xproduto
 where 
  codproduto in (select codproduto from xitensvenda)
 group by 
  descricaoproduto
 having 
  max(preco) = (select max(preco) from xproduto)

  
-- + 4 – Selecionar o nome do cliente e descrição do tipo de pagamento utilizado nas vendas.

select distinct
 cliente, 
 descricaotppagamento
 from 
  xcliente, 
  xvenda, 
  xitensvenda, 
  xproduto, 
  xtipospagamento
 where 
  xcliente.codcliente = xvenda.codcliente
  and xvenda.nnf = xitensvenda.nnf
  and xitensvenda.codproduto = xproduto.codproduto
  and xvenda.codtppagamento = xtipospagamento.codtppagamento

-- + 5 – Selecionar o nome do cliente, nnf, data da venda, descrição do tipo de pagamento, descrição do produto e quantidade vendida dos itens vendidos.

select 
 xcliente.cliente, 
 xvenda.nnf, 
 xvenda.dtvenda, 
 xtipospagamento.descricaotppagamento, 
 xproduto.descricaoproduto, 
 xitensvenda.qtde
 from 
  xcliente, 
  xvenda,
  xtipospagamento,
  xproduto,
  xitensvenda  
 where 
  xcliente.codcliente = xvenda.codcliente
  and xvenda.nnf = xitensvenda.nnf
  and xvenda.dtvenda = xitensvenda.dtvenda 
  and xitensvenda.codproduto = xproduto.codproduto
  and xvenda.codtppagamento = xtipospagamento.codtppagamento
 order by 
  cliente

-- + 6 – Selecionar a média de preço dos produtos vendidos.

select distinct
 round(cast(avg(preco) as numeric),2)
 from 
  xproduto
 where 
  codproduto in (select codproduto from xitensvenda)

-- + 7 – Selecionar o nome do cliente e a descrição dos produtos comprados por ele. Não repetir os dados (distinct)

select distinct
 xcliente.cliente, 
 xproduto.descricaoproduto
 from 
  xcliente, 
  xvenda, 
  xitensvenda, 
  xproduto
 where 
  xcliente.codcliente = xvenda.codcliente
  and xvenda.nnf = xitensvenda.nnf
  and xvenda.dtvenda = xitensvenda.dtvenda 
  and xitensvenda.codproduto = xproduto.codproduto
  order by 
   cliente

-- + 8 – Selecionar a descrição do tipo de pagamento, e a maior data de venda que utilizou esse tipo de pagamento. Ordenar a consulta pela descrição do tipo de pagamento.

select distinct
 xtipospagamento.descricaotppagamento,  
 max(xvenda.dtvenda)
 from 
  xtipospagamento,
  xvenda  
 where 
  xvenda.codtppagamento = xtipospagamento.codtppagamento
  group by 
   xtipospagamento.descricaotppagamento
  order by 
   xtipospagamento.descricaotppagamento

-- + 9 – Selecionar a data da venda e a média da quantidade de produtos vendidos. Ordenar pela data da venda decrescente.

select 
 dtvenda, 
 avg(qtde)
 from 
  xitensvenda
 group by 
  dtvenda
 order by 
  dtvenda desc
 
-- + 10 – Selecionar a descrição do produto e a média de quantidades vendidas do produto. Somente se a média for superior a 4

select 
 xproduto.descricaoproduto, 
 avg(xitensvenda.qtde)
 from 
  xitensvenda, 
  xproduto
 where 
  xitensvenda.codproduto = xproduto.codproduto
 group by 
  xproduto.descricaoproduto
 having 
  avg(xitensvenda.qtde) > 4
  