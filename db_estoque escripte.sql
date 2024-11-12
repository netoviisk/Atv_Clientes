CREATE DATABASE db_estoque; --Comando para criar o banco de dados

Use db_estoque; --Comando para selecionar o banco

CREATE TABLE produto( --Comando para criar a tabela Produto e seus campos
     pro_codigo     INT PRIMARY KEY AUTO_INCREMENT,
     pro_nome       VARCHAR(45),
     pro_valor      FLOAT,
     pro_peso       FLOAT,
     pro_descricao  VARCHAR(45),
     pro_qntdmin    INT,
     cat_codigo     INT,
     for_codigo     INT
);

CREATE TABLE categoria ( --Comando para criar a tabela categoria e seus campos
     cat_codigo  INT PRIMARY KEY AUTO_INCREMENT,
     cat_nome    VARCHAR(45)
);

CREATE TABLE cidade( --Comando para criar a tabela cidade e seus campos
     cid_codigo  INT PRIMARY KEY AUTO_INCREMENT,
     cid_nome    VARCHAR(45),
     cid_uf      VARCHAR(2)
);

CREATE TABLE loja ( --Comando para criar a tabela loja e seus campos
     loj_codigo   INT PRIMARY KEY AUTO_INCREMENT,
     loj_nome     VARCHAR(45),
     loj_endereco VARCHAR(45),
     loj_telefone INT,
     loj_cnpj     INT(14),
     cid_codigo   INT
); 

CREATE TABLE fornecedor( --Comando para criar a tabela fornecedor e seus campos
     for_codigo   INT PRIMARY KEY AUTO_INCREMENT,
     for_nome     VARCHAR(45),
     for_cnpj     INT(14),
     for_endereco VARCHAR(45),
     for_cep      INT,
     for_telegone INT,
     for_bairro   VARCHAR(45),
     for_contato  VARCHAR(45),
     cid_codigo   INT
); 

CREATE TABLE distribuidora ( --Comando para criar a tabela distribuidora e seus campos
     dis_codigo   INT PRIMARY KEY AUTO_INCREMENT,
     dis_nome     VARCHAR(45),
     dis_endereco VARCHAR(45),
     dis_cnpj     INT(14),
     dis_telefone INT,
     dis_bairro   VARCHAR(45),
     dis_contato  VARCHAR(45),
     dis_cep      INT,
     cid_codigo   INT
);

CREATE TABLE entrada ( --Comando para criar a tabela entrada e seus campos
     ent_codigo       INT PRIMARY KEY AUTO_INCREMENT,
     ent_data_pedido  DATE,
     ent_data_entrada DATE,
     ent_total        FLOAT,
     ent_frete        FLOAT,
     ent_imposto      FLOAT
);

CREATE TABLE item_entrada ( --Comando para criar a tabela item_entrada e seus campos
     ite_codigo INT PRIMARY KEY AUTO_INCREMENT,
     ite_valor  FLOAT,
     ite_qtde   INT,
     ite_lote   VARCHAR(45),
     ent_codigo INT,
     pro_codigo INT
);

CREATE TABLE saida ( --Comando para criar a tabela saida e seus campos
    sai_codigo  INT PRIMARY KEY AUTO_INCREMENT,
    sai_total   FLOAT,
    sai_frete   FLOAT,
    sai_imposto FLOAT,
    loj_codigo  INT,
    dis_codigo  INT
);

CREATE TABLE item_saida ( --Comando para criar a tabela item_saida e seus campos
   its_codigo   INT PRIMARY KEY AUTO_INCREMENT,
   its_lote     VARCHAR(45),
   its_qtde     INT,
   its_valor    FLOAT,
   sai_codigo   INT,
   pro_codigo   INT
);

ALTER TABLE produto --Comando Para tranformar a chave cat_codigo em estrangeira na tabela produto
ADD CONSTRAINT fk_produto_cat_codigo FOREIGN KEY (cat_codigo) REFERENCES categoria (cat_codigo)

ALTER TABLE produto --Comando Para tranformar a chave for_codigo em estrangeira na tabela produto
ADD CONSTRAINT fk_produto_for_codigo FOREIGN KEY (for_codigo) REFERENCES fornecedor (for_codigo)

ALTER TABLE loja --Comando Para tranformar a chave cid_codigo em estrangeira na tabela loja
ADD CONSTRAINT fk_loja_cid_codigo FOREIGN KEY (cid_codigo) REFERENCES cidade (cid_codigo)

ALTER TABLE fornecedor --Comando Para tranformar a chave cid_codigo em estrangeira na tabela fornecedor
ADD CONSTRAINT fk_fornecedor_cid_codigo FOREIGN KEY (cid_codigo) REFERENCES cidade (cid_codigo)

ALTER TABLE distribuidora --Comando Para tranformar a chave cid_codigo em estrangeira na tabela distribuidora
ADD CONSTRAINT fk_distribuidora_cid_codigo FOREIGN KEY (cid_codigo) REFERENCES cidade (cid_codigo)

ALTER TABLE item_entrada --Comando Para tranformar a chave ent_codigo em estrangeira na tabela entrada
ADD CONSTRAINT fk_item_entrada_ent_codigo FOREIGN KEY (ent_codigo) REFERENCES entrada (ent_codigo)

ALTER TABLE item_entrada --Comando Para tranformar a chave pro_codigo em estrangeira na tabela item_entrada
ADD CONSTRAINT fk_item_entrada_pro_codigo FOREIGN KEY (pro_codigo) REFERENCES produto (pro_codigo)

ALTER TABLE entrada --Comando para adiionar a chave estrangeira dis_codigo na tabela entrada
ADD COLUMN dis_codigo INT,
ADD CONSTRAINT fk_entrada_dis_codigo FOREIGN KEY (dis_codigo) REFERENCES distribuidora (dis_codigo)

ALTER TABLE saida --Comando Para tranformar a chave loj_codigo em estrangeira na tabela saida
ADD CONSTRAINT fk_saida_loj_codigo FOREIGN KEY (loj_codigo) REFERENCES loja (loj_codigo)

ALTER TABLE saida --Comando Para tranformar a chave dis_codigo em estrangeira na tabela siada
ADD CONSTRAINT fk_saida_dis_codigo FOREIGN KEY (dis_codigo) REFERENCES distribuidora (dis_codigo)

ALTER TABLE item_saida --Comando Para tranformar a chave sai_codigo em estrangeira na tabela item_saida
ADD CONSTRAINT fk_item_saida_sai_codigo FOREIGN KEY (sai_codigo) REFERENCES saida (sai_codigo)

ALTER TABLE item_saida --Comando Para tranformar a chave pro_codigo em estrangeira na tabela item_saida
ADD CONSTRAINT fk_item_saida_pro_codigo FOREIGN KEY (pro_codigo) REFERENCES produto (pro_codigo)

INSERT INTO cidade(cid_nome,cid_uf)
VALUES("Itumbiara","GO")

INSERT INTO categoria(cat_nome)
VALUES ("enlatados")

INSERT INTO produto(pro_nome,pro_valor,pro_peso,pro_descricao,pro_qntdmin)
VALUES ("Café do vovo",15.50,5,"café preto e forte",3)

INSERT INTO