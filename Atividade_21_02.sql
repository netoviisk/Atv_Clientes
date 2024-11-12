CREATE DATABASE db_atividade_21_02; --Criando a Database

USE db_atividade_21_02;             --Selecionando

CREATE TABLE at_produto(            --Criando Tabela
   pro_id_nf      INT   NOT NULL,
   pro_id_item    INT   NOT NULL,
   pro_cod_prod   INT   NOT NULL,
   pro_valor_unit FLOAT NOT NULL,
   pro_quantidade INT   NOT NULL,
   pro_desconto   INT
)

-- Inserindo Valores

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (1,1,1,25.00,10,5);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (1,2,2,13.50,3,NULL);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (1,3,3,15.00,2,NULL);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (1,4,4,10.00,1,NULL);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (1,5,5,30.00,1,NULL);

--

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (2,1,3,15.00,4,NULL);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (2,2,4,10.00,5,NULL);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (2,3,5,30.00,7,NULL);

--

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (3,1,1,25.00,5,NULL);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (3,2,4,10.00,4,NULL);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (3,3,5,30.00,5,NULL);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (3,4,2,13.50,7,NULL);

--

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (4,1,5,30.00,10,15);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (4,2,4,10.00,12,5);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (4,3,1,25.00,13,5);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (4,4,2,13.50,15,5);

--

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (5,1,3,15.00,3,NULL);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (5,2,5,30.00,6,NULL);

--

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (6,1,1,25.00,22,15);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (6,2,3,15.00,25,20);

--

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (7,1,1,25.00,10,3);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (7,2,2,13.50,10,4);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (7,3,3,15.00,10,4);

INSERT INTO at_produto(pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade,pro_desconto)
VALUES (7,4,5,30.00,10,1);

-- Término da Inserção
-- Atividades

--A)
SELECT   pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit
FROM     at_produto
WHERE    pro_desconto IS NULL;

--B)
SELECT   pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit -(pro_valor_unit*(pro_desconto/100)) 
AS       pro_valor_vendido
FROM     at_produto
WHERE    pro_desconto IS NOT NULL;

--C)
UPDATE   at_produto
SET      pro_desconto = 0
WHERE    pro_desconto IS NULL;

--D)
SELECT   pro_id_nf,pro_id_item,pro_cod_prod,pro_valor_unit,pro_quantidade * pro_valor_unit
AS       pro_valor_total,pro_desconto,pro_valor_unit - (pro_valor_unit*(pro_desconto/100))
AS       pro_valor_vendido
FROM     at_produto;

--E)
SELECT   pro_id_nf, SUM(pro_quantidade * pro_valor_unit)
AS       pro_valor_total
FROM     at_produto
GROUP BY pro_id_nf DESC;

--F)
SELECT   pro_id_nf,SUM(pro_quantidade * pro_valor_unit)
AS       pro_valor_total,SUM(pro_valor_unit - (pro_valor_unit*(pro_desconto/100))) 
AS       pro_valor_vendido
FROM     at_produto
GROUP BY pro_id_nf DESC;

--G)
SELECT   pro_cod_prod,pro_quantidade
FROM     at_produto
GROUP BY pro_cod_prod ASC;

--H)
SELECT   pro_id_nf,pro_cod_prod,pro_quantidade
FROM     at_produto
WHERE    pro_quantidade > 10
GROUP BY pro_id_nf,pro_cod_prod;

--I)
SELECT   pro_id_nf,SUM(pro_quantidade * pro_valor_unit)
AS       pro_valor_tot
FROM     at_produto
GROUP BY pro_id_nf
HAVING   pro_valor_tot > 500
ORDER BY pro_valor_tot DESC;

--J)
SELECT   pro_cod_prod, 
         AVG(pro_desconto)
AS       pro_media
FROM     at_produto
GROUP BY pro_cod_prod;

--K)
SELECT   pro_cod_prod,
         MIN(pro_desconto) AS pro_menor,
         MAX(pro_desconto) AS pro_maior,
         AVG(pro_desconto) AS pro_media
FROM     at_produto
GROUP BY pro_cod_prod;

--L)
SELECT   pro_id_nf,
         COUNT(*) AS pro_qntd_itens
FROM     at_produto
GROUP BY pro_id_nf
HAVING   pro_qntd_itens > 3;