CREATE DATABASE db_livraria

USE db_livraria;

CREATE TABLE tbl_clientes(
   cli_codigo   INT PRIMARY KEY,
   cli_cpf      VARCHAR(100),
   cli_cnpj     VARCHAR(100),
   cli_endereco VARCHAR(100),
   cli_fone     VARCHAR(100)
);

CREATE TABLE tbl_compras(
   com_codigo      INT PRIMARY KEY,
   com_data        DATE,
   com_valor_total FLOAT,
   com_quantidade  INT,
   cli_codigo      INT
);

CREATE TABLE tbl_lista(
   lis_codigo INT PRIMARY KEY,
   com_codigo INT,
   liv_codigo INT
);

CREATE TABLE tbl_livros(
   liv_codigo             INT PRIMARY KEY,
   liv_nome               VARCHAR(100),
   liv_autor              VARCHAR(100),
   liv_assunto            VARCHAR(100),
   liv_isbn               VARCHAR(100),
   liv_quantidade_estoque INT,
   edi_codigo             INT
);
   
CREATE TABLE tbl_editoras(
   edi_codigo   INT PRIMARY KEY,
   edi_nome     VARCHAR(100),
   edi_endereco VARCHAR(100),
   edi_contato  VARCHAR(100)
);

   ALTER TABLE tbl_compras
   ADD CONSTRAINT fk_clientes_cli_codigo FOREIGN KEY (cli_codigo) REFERENCES tbl_clientes(cli_codigo);
   ALTER TABLE tbl_lista
   ADD CONSTRAINT fk_compras_com_codigo FOREIGN KEY (com_codigo) REFERENCES tbl_compras(com_codigo);
   ALTER TABLE tbl_lista
   ADD CONSTRAINT fk_livros_liv_codigo FOREIGN KEY (liv_codigo) REFERENCES tbl_livros(liv_codigo);
   ALTER TABLE tbl_livros
   ADD CONSTRAINT fk_editoras_edi_codigo FOREIGN KEY (edi_codigo) REFERENCES tbl_editoras (edi_codigo);
-