CREATE DATABASE db_senaicria

CREATE TABLE tbl_produto(
   pro_id         INT PRIMARY KEY,
   pro_nome       VARCHAR(45),
   pro_valor      FLOAT,
   pro_quantidade INT
)

INSERT INTO tbl_produto(pro_id,pro_nome,pro_valor,pro_quantidade)
VALUES(1,"Lápis",1.00,10);

INSERT INTO tbl_produto(pro_id,pro_nome,pro_valor,pro_quantidade)
VALUES(2,"Borracha",3.00,10);

INSERT INTO tbl_produto(pro_id,pro_nome,pro_valor,pro_quantidade)
VALUES(3,"Carderno",15.00,10);

SELECT COUNT(*) AS pro_quantidade FROM tbl_produto; -- Quantidade de Itens

SELECT MIN(pro_id) AS Menor FROM tbl_produto;                           -- Menor ID

SELECT MAX(pro_id) AS Maior FROM tbl_produto;                           -- Maior ID

SELECT AVG(pro_valor) AS Média FROM tbl_produto;                        -- Media de Valores

SELECT SUM(pro_valor * pro_quantidade) AS ValorTotal FROM tbl_produto;  -- Valor Total dos Produtos