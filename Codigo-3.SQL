CREATE DATABASE db_estoque_netor; --Comando para criar o banco de dados

Use db_estoque_netor; --Comando para selecionar o banco

CREATE TABLE produto(
     pro_codigo     INT PRIMARY KEY AUTO_INCREMENT,
     pro_nome       VARCHAR(45),
     pro_valor      FLOAT,
     pro_peso       FLOAT,
     pro_descricao  VARCHAR(45),
     pro_qntdmin    INT,
     cat_codigo     INT,
     for_codigo     INT
);

CREATE TABLE categoria ( 
     cat_codigo  INT PRIMARY KEY AUTO_INCREMENT,
     cat_nome    VARCHAR(45)
);

CREATE TABLE cidade( 
     cid_codigo  INT PRIMARY KEY AUTO_INCREMENT,
     cid_nome    VARCHAR(45),
     cid_uf      VARCHAR(2)
);

CREATE TABLE loja ( 
     loj_codigo   INT PRIMARY KEY AUTO_INCREMENT,
     loj_nome     VARCHAR(45),
     loj_endereco VARCHAR(45),
     loj_telefone INT,
     loj_cnpj     INT(14),
     cid_codigo   INT
); 

CREATE TABLE fornecedor( 
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

CREATE TABLE distribuidora ( 
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

CREATE TABLE entrada ( 
     ent_codigo       INT PRIMARY KEY AUTO_INCREMENT,
     ent_data_pedido  DATE,
     ent_data_entrada DATE,
     ent_total        FLOAT,
     ent_frete        FLOAT,
     ent_imposto      FLOAT
);

CREATE TABLE item_entrada ( 
     ite_codigo INT PRIMARY KEY AUTO_INCREMENT,
     ite_valor  FLOAT,
     ite_qtde   INT,
     ite_lote   VARCHAR(45),
     ent_codigo INT,
     pro_codigo INT
);

CREATE TABLE saida ( 
    sai_codigo  INT PRIMARY KEY AUTO_INCREMENT,
    sai_total   FLOAT,
    sai_frete   FLOAT,
    sai_imposto FLOAT,
    loj_codigo  INT,
    dis_codigo  INT
);

CREATE TABLE item_saida ( 
   its_codigo   INT PRIMARY KEY AUTO_INCREMENT,
   its_lote     VARCHAR(45),
   its_qtde     INT,
   its_valor    FLOAT,
   sai_codigo   INT,
   pro_codigo   INT
);

ALTER TABLE produto 
ADD CONSTRAINT fk_produto_cat_codigo FOREIGN KEY (cat_codigo) REFERENCES categoria (cat_codigo)

ALTER TABLE produto 
ADD CONSTRAINT fk_produto_for_codigo FOREIGN KEY (for_codigo) REFERENCES fornecedor (for_codigo)

ALTER TABLE loja 
ADD CONSTRAINT fk_loja_cid_codigo FOREIGN KEY (cid_codigo) REFERENCES cidade (cid_codigo)

ALTER TABLE fornecedor
ADD CONSTRAINT fk_fornecedor_cid_codigo FOREIGN KEY (cid_codigo) REFERENCES cidade (cid_codigo)

ALTER TABLE distribuidora 
ADD CONSTRAINT fk_distribuidora_cid_codigo FOREIGN KEY (cid_codigo) REFERENCES cidade (cid_codigo)

ALTER TABLE item_entrada 
ADD CONSTRAINT fk_item_entrada_ent_codigo FOREIGN KEY (ent_codigo) REFERENCES entrada (ent_codigo)

ALTER TABLE item_entrada 
ADD CONSTRAINT fk_item_entrada_pro_codigo FOREIGN KEY (pro_codigo) REFERENCES produto (pro_codigo)

ALTER TABLE entrada 
ADD COLUMN dis_codigo INT,
ADD CONSTRAINT fk_entrada_dis_codigo FOREIGN KEY (dis_codigo) REFERENCES distribuidora (dis_codigo)

ALTER TABLE saida 
ADD CONSTRAINT fk_saida_loj_codigo FOREIGN KEY (loj_codigo) REFERENCES loja (loj_codigo)

ALTER TABLE saida 
ADD CONSTRAINT fk_saida_dis_codigo FOREIGN KEY (dis_codigo) REFERENCES distribuidora (dis_codigo)

ALTER TABLE item_saida
ADD CONSTRAINT fk_item_saida_sai_codigo FOREIGN KEY (sai_codigo) REFERENCES saida (sai_codigo)

ALTER TABLE item_saida 
ADD CONSTRAINT fk_item_saida_pro_codigo FOREIGN KEY (pro_codigo) REFERENCES produto (pro_codigo)

INSERT INTO cidade(cid_nome,cid_uf)
VALUES("Itumbiara","GO");

INSERT INTO cidade(cid_nome,cid_uf)
VALUES("Cachoeira Dourada","GO");

INSERT INTO cidade(cid_nome,cid_uf)
VALUES("Bom Jesus","GO");

INSERT INTO cidade(cid_nome,cid_uf)
VALUES("Goiânia","GO");

INSERT INTO cidade(cid_nome,cid_uf)
VALUES("Ituiutaba","MG");

INSERT INTO categoria(cat_nome)
VALUES("Enlatados"); 

INSERT INTO categoria(cat_nome)
VALUES("Frios");

INSERT INTO categoria(cat_nome)
VALUES("Limpeza"); 

INSERT INTO categoria(cat_nome)
VALUES("Informatica"); 

INSERT INTO categoria(cat_nome)
VALUES("Artigos Esportivos"); 

INSERT INTO fornecedor(for_nome,for_cnpj,for_endereco,for_cep,for_telegone,for_bairro,for_contato,for_codigo)
VALUES("Artigos Esportivos",98123452341987,"Carteiro",75430000,98842933,"Leste","@Carlim",1); 

INSERT INTO fornecedor(for_nome,for_cnpj,for_endereco,for_cep,for_telegone,for_bairro,for_contato,for_codigo)
VALUES("Portal Zacarias",09857489341234,"Vila Cesamo",75560000,96624590,"Av Sul","Zecas@",2); 

INSERT INTO fornecedor(for_nome,for_cnpj,for_endereco,for_cep,for_telegone,for_bairro,for_contato,for_codigo)
VALUES("Carol Burguer",08345278901236,"Kurt Coubein",75569000,81139908,"Coquinhas","BURGÂOdisc",3);

INSERT INTO fornecedor(for_nome,for_cnpj,for_endereco,for_cep,for_telegone,for_bairro,for_contato,for_codigo)
VALUES("Cangaço's Inc",68597049385523,"Mussarela",34789000,99998221,"13","Cachacinea_Ofic",4); 

INSERT INTO fornecedor(for_nome,for_cnpj,for_endereco,for_cep,for_telegone,for_bairro,for_contato,for_codigo)
VALUES("Correbeg",22298789001245,"ConaqueCj",98740000,90902345,"Conaque 3","Telefone Dele :)",5); 

INSERT INTO produto(pro_nome,pro_valor,pro_peso,pro_descricao,pro_qntdmin,cat_codigo,for_codigo)
VALUES("Azeitona",2.00,0.500,"Enlatados",10,1,2);

INSERT INTO produto(pro_nome,pro_valor,pro_peso,pro_descricao,pro_qntdmin,cat_codigo,for_codigo)
VALUES("Raquete",300.00,1.000,"Esportivos",2,5,1);

INSERT INTO produto(pro_nome,pro_valor,pro_peso,pro_descricao,pro_qntdmin,cat_codigo,for_codigo)
VALUES("Processador",5.00,0.100,"Informatica",1,4,5);

INSERT INTO produto(pro_nome,pro_valor,pro_peso,pro_descricao,pro_qntdmin,cat_codigo,for_codigo)
VALUES("Sabão Liquido",3.00,0.900,"Limpeza",1,2,4);

INSERT INTO produto(pro_nome,pro_valor,pro_peso,pro_descricao,pro_qntdmin,cat_codigo,for_codigo)
VALUES("Hamburguer",10.00,0.600,"Frios",6,3,3);

INSERT INTO loja(loj_nome,loj_endereco,loj_telefone,loj_cnpj,cid_codigo)
VALUES("Comercio do João","Liverpool",98870908,98982345612341,1);

INSERT INTO loja(loj_nome,loj_endereco,loj_telefone,loj_cnpj,cid_codigo)
VALUES("Comerciaria JN","CENTRO",56989943,98982345322341,2);

INSERT INTO loja(loj_nome,loj_endereco,loj_telefone,loj_cnpj,cid_codigo)
VALUES("Coquinho Destribuição","Disgraçolandia",98870902,98982345612841,3);

INSERT INTO loja(loj_nome,loj_endereco,loj_telefone,loj_cnpj,cid_codigo)
VALUES("Tijuquinha","JANDAIA",98340908,96857434567832,4);

INSERT INTO loja(loj_nome,loj_endereco,loj_telefone,loj_cnpj,cid_codigo)
VALUES("Joiltu","Nova",98678908,98982345614341,5);

INSERT INTO distribuidora(dis_nome,dis_endereco,dis_cnpj,dis_telefone,dis_bairro,dis_contato,dis_cep,cid_codigo)
VALUES("Carlinhos","Bébe *****",03424567654356,98765678,"Ai Tu Ratio","Bixão@",98534999,1);

INSERT INTO distribuidora(dis_nome,dis_endereco,dis_cnpj,dis_telefone,dis_bairro,dis_contato,dis_cep,cid_codigo)
VALUES("Dinossaurus Dist","Osmar Diasis",03434567654356,98762678,"FF Cria","Viximalia334@gmail.com",98534939,2);

INSERT INTO distribuidora(dis_nome,dis_endereco,dis_cnpj,dis_telefone,dis_bairro,dis_contato,dis_cep,cid_codigo)
VALUES("Ai tu ve","Se tu ta",03424567454356,98765678,"Coisado","Kukuspaia",98534919,3);

INSERT INTO distribuidora(dis_nome,dis_endereco,dis_cnpj,dis_telefone,dis_bairro,dis_contato,dis_cep,cid_codigo)
VALUES("Ahnnn","Coisas?",03224567654356,98765678,"...","Loli",88534999,4);

INSERT INTO distribuidora(dis_nome,dis_endereco,dis_cnpj,dis_telefone,dis_bairro,dis_contato,dis_cep,cid_codigo)
VALUES("Evangelicos","Eva-01",03424567654356,98765678,"Ruindade","Lolicon.com",98534999,5);

INSERT INTO entrada(ent_data_pedido,ent_data_entrada,ent_total,ent_frete,ent_imposto,dis_codigo)
VALUES(2023-04-12,2023-04-22,977.34,120.00,88.00,1);

INSERT INTO entrada(ent_data_pedido,ent_data_entrada,ent_total,ent_frete,ent_imposto,dis_codigo)
VALUES(2023-8-10,2023-8-20,1098.32,100.00,32.34,2);

INSERT INTO entrada(ent_data_pedido,ent_data_entrada,ent_total,ent_frete,ent_imposto,dis_codigo)
VALUES(2023-11-23,2023-12-03,2567.99,98.00,99.99,3);

INSERT INTO entrada(ent_data_pedido,ent_data_entrada,ent_total,ent_frete,ent_imposto,dis_codigo)
VALUES(2024-01-01,2024-01-11,873.66,100.00,123.56,4);

INSERT INTO entrada(ent_data_pedido,ent_data_entrada,ent_total,ent_frete,ent_imposto,dis_codigo)
VALUES(2024-02-09,2024-02-19,4420.00,120.00,89.99,5);

INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(20.00,3,"3",1,1);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(10.00,2,"3",1,1);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(25.00,5,"3",1,1);

INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(5.50,3,"3",2,2);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(7.99,1,"3",2,2);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(2.89,1,"3",2,2);

INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(19.99,10,"3",3,3);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(6.79,1,"3",3,3);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(2.49,2,"3",3,3);

INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(0.99,1,"3",4,4);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(4.99,1,"3",4,4);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(3.50,3,"3",4,4);

INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(22.49,1,"3",5,5);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(24.00,1,"3",5,5);
INSERT INTO item_entrada(ite_valor,ite_qtde,ite_lote,ent_codigo,pro_codigo)
VALUES(10.99,1,"3",5,5);

INSERT INTO saida(sai_total,sai_frete,sai_imposto,loj_codigo,dis_codigo)
VALUES(49.99,0.99,0.99,1,1);

INSERT INTO saida(sai_total,sai_frete,sai_imposto,loj_codigo,dis_codigo)
VALUES(68.70,2.00,2.10,2,2);

INSERT INTO saida(sai_total,sai_frete,sai_imposto,loj_codigo,dis_codigo)
VALUES(120.09,8.00,9.20,3,3);

INSERT INTO saida(sai_total,sai_frete,sai_imposto,loj_codigo,dis_codigo)
VALUES(55.55,1.10,1.55,4,4);

INSERT INTO saida(sai_total,sai_frete,sai_imposto,loj_codigo,dis_codigo)
VALUES(100.00,7.50,6.20,5,5);

INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",5,9,1,1);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",4,8,1,1);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",3,7,1,1);

INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",3,10.0,2,2);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",2,45.6,2,2);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",1,10.10,2,2);

INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",8,5.5,3,3);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",7,7.6,3,3);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",6,8,3,3);

INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",2,21.00,4,4);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",1,20.99,4,4);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",7,10,4,4);

INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",10,50,5,5);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",11,40,5,5);
INSERT INTO item_saida(its_lote,its_qtde,its_valor,sai_codigo,pro_codigo)
VALUES("3",2,30,5,5);

SELECT *
FROM categoria
WHERE cat_nome = "Limpeza"

SELECT *
FROM cidade
WHERE cid_uf = "MG"

SELECT *
FROM distribuidora
WHERE dis_bairro = "Ruindade"

SELECT *
FROM entrada
WHERE ent_frete = 120

SELECT *
FROM fornecedor
WHERE for_endereco = "Vila Cesamo"

SELECT *
FROM item_entrada
WHERE ite_valor = 25

SELECT *
FROM item_saida
WHERE its_qtde = 3

SELECT *
FROM loja
WHERE loj_nome = "Joiltu"

SELECT *
FROM produto
WHERE pro_valor = 300

SELECT *
FROM saida
WHERE sai_imposto > 1