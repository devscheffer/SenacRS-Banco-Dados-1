-- + 1) Recuperar os nomes de todos os engenheiros, que projetaram obras
-- nas quais o operário João Souza tenha trabalhado em junho de 97
-- NOME_ENG
-- ------------------------------
-- Carlos Alvarez

select 
 engenheiro.crea,
 engenheiro.nome_eng,
 obra.nome_obra,
 obra_operario.data,
 operario.nomeop
 from
  engenheiro,
  obra,
  obra_operario,
  operario
 where
  engenheiro.crea = obra.cod_eng_resp
  and obra.cod_obra = obra_operario.cod_obra
  and obra_operario.cart_trab = operario.cart_trab
  and nomeop = 'Joao Souza'
  and date_part ( 'year', obra_operario.data) = '1997'
  and date_part( 'month', obra_operario.data) = '06'

-- + 2) Recuperar os nomes dos operários que trabalharam em obras de
-- pelo menos todos os engenheiros da area de Pontes/Viadutos.
-- NOMEOP
-- ------------------------------
-- Paulo Castro

select 
 operario.nomeop,
 count(engenheiro.nome_eng)
 from
  engenheiro,
  obra,
  obra_operario,
  operario
 where
  engenheiro.crea = obra.cod_eng_resp
  and obra.cod_obra = obra_operario.cod_obra
  and obra_operario.cart_trab = operario.cart_trab
  and area_atuacao = 'Pontes/Viadutos'
  group by
   operario.nomeop
  having 
   count(engenheiro.nome_eng) = (
	   select 
	    count(engenheiro.nome_eng )
	    from 
	     engenheiro 
	    where 
	     area_atuacao = 'Pontes/Viadutos'
   )
 
-- + 3) Para cada operário que trabalha para mais de uma construtora,
-- recuperar o seu nome e os nomes das construtoras.
-- NOMEOP NOME_CONST
-- ----------------------------- ------------------------------
-- Paulo Castro A3
-- Paulo Castro Metaplan
-- Joao Souza Encol
-- Joao Souza Metaplan


select 
 operario.nomeop,
 construtora.nome_const
 from
  operario,
  operario_construtora,
  construtora
 where
  operario.cart_trab = operario_construtora.cart_trab
  and operario_construtora.cod_const = construtora.cod_const
  and nomeop in (
	  select 
	   operario.nomeop
	  from 
	   operario,
       operario_construtora,
       construtora
	  where
	   operario.cart_trab = operario_construtora.cart_trab
  	   and operario_construtora.cod_const = construtora.cod_const
	  group by
	   nomeop
	  having
	   count(construtora.nome_const) > 1
  )
 order by
  nomeop

-- + 4) Recuperar os nomes dos operários que trabalham em somente uma
-- construtora.
-- NOMEOP
-- ------------------------------
-- Luis Padilha

select 
 operario.nomeop,
 construtora.nome_const
 from
  operario,
  operario_construtora,
  construtora
 where
  operario.cart_trab = operario_construtora.cart_trab
  and operario_construtora.cod_const = construtora.cod_const
  and nomeop in (
	  select 
	   operario.nomeop
	  from 
	   operario,
       operario_construtora,
       construtora
	  where
	   operario.cart_trab = operario_construtora.cart_trab
  	   and operario_construtora.cod_const = construtora.cod_const
	  group by
	   nomeop
	  having
	   count(construtora.nome_const) = 1
  )
 order by
  nomeop

-- + 5) Recuperar os nomes dos engenheiros que atuam em alguma
-- construtora além da Encol.
-- NOME_ENG
-- ------------------------------
-- Luis Silva

select
 engenheiro.nome_eng,
 construtora.nome_const
 from
  engenheiro,
  obra,
  construtora
 where
  engenheiro.crea = obra.cod_eng_resp
  and obra.cod_const = construtora.cod_const
  and engenheiro.nome_eng in (
	  select
	   engenheiro.nome_eng
	  from
	   engenheiro,
       obra,
       construtora
      where
       engenheiro.crea = obra.cod_eng_resp
       and obra.cod_const = construtora.cod_const
 	   and engenheiro.nome_eng in (
		   select
		    engenheiro.nome_eng
		   from
		    engenheiro,
            obra,
            construtora
		   where
		    engenheiro.crea = obra.cod_eng_resp
            and obra.cod_const = construtora.cod_const
		    and construtora.nome_const = 'Encol'
	   )
	  group by
	   nome_eng
	  having
	   count(construtora.nome_const) > 1
  )
  
-- + 6) Para cada construtora, recuperar o nome da construtora e o
-- número de engenheiros da área de Edificação.
-- NOME_CONST Qtde de Engenheiros
-- ------------------------------ ---------------------------
-- A3 1
-- Encol 1
-- Goldzstein 1

select
 construtora.nome_const,
 count(engenheiro.area_atuacao)
 from
  construtora,
  obra,
  engenheiro
 where 
  engenheiro.crea = obra.cod_eng_resp
  and obra.cod_const = construtora.cod_const
  and engenheiro.area_atuacao = 'Edificacao'
 group by 
  construtora.nome_const
 order by
  construtora.nome_const
  
-- -- 7) Para cada operário da construtora Encol, recuperar o seu numero
-- de carteira de trabalho, nome e o numero de obras (mesmo não sendo da
-- construtora Encol) nas quais trabalhou no primeiro semestre de 97.
-- CART_TRAB NOMEOP Qtde de Obras
-- --------------- ------------------------------ -----------------------
-- op030 Joao Souza 1

select
 operario.cart_trab,
 operario.nomeop,
 count(distinct obra_operario.cod_obra)
 from
  operario,
  operario_construtora,
  construtora,
  obra_operario
 where 
  operario.cart_trab = operario_construtora.cart_trab
  and operario_construtora.cod_const = construtora.cod_const
  and operario.cart_trab = obra_operario.cart_trab
  and date_part ( 'year', obra_operario.data) = '1997'
  and date_part ( 'month', obra_operario.data) <= 6
  and nomeop in (
	 select
	  operario.nomeop
	 from
      operario,
      operario_construtora,
      construtora
     where 
	  operario.cart_trab = operario_construtora.cart_trab
      and operario_construtora.cod_const = construtora.cod_const
	  and construtora.nome_const = 'Encol'
 )
 group by
  operario.cart_trab,
  operario.nomeop
 order by
 nomeop
   