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

SELECT COUNT(*) AS Quantidade FROM tbl_produto;                         -- Quantidade de Itens

SELECT MIN(pro_id) AS Menor FROM tbl_produto;                           -- Menor ID

SELECT MAX(pro_id) AS Maior FROM tbl_produto;                           -- Maior ID

SELECT AVG(pro_valor) AS Média FROM tbl_produto;                        -- Media de Valores

SELECT SUM(pro_valor * pro_quantidade) AS ValorTotal FROM tbl_produto;  -- Valor Total dos Produtos

SELECT pro_id, SUM(pro_valor) TOTAL
FROM tbl_produto
GROUP BY pro_id
HAVING SUM(pro_valor) > 100;

SELECT pro_id, SUM(pro_valor) TOTAL
FROM tbl_produto
GROUP BY pro_id
ORDER BY pro_id

SELECT pro_id, SUM(pro_valor) TOTAL
FROM tbl_produto
GROUP BY pro_id
ORDER BY pro_id ASC;

SELECT pro_id, SUM(pro_valor) TOTAL
FROM tbl_produto
GROUP BY pro_id
ORDER BY pro_id DESC;

CREATE TABLE tbl_categoria(
   cat_id          INT PRIMARY KEY AUTO_INCREMENT,
   cat_nome        VARCHAR(45),
   cat_cozinha     VARCHAR(45),
   cat_limpeza     VARCHAR(45),
   cat_laticinios  VARCHAR(45),
   cat_cereais     VARCHAR(45),
   cat_informatica VARCHAR(45),
)

ALTER TABLE tbl_produto
ADD COLUMN cat_id INT;

ALTER TABLE tbl_produto
ADD CONSTRAINT fk_produto_cat_id FOREIGN KEY(cat_id) REFERENCES tbl_categoria(cat_id);

UPDATE tbl_produto
SET cat_id = 4
WHERE pro_id = 3