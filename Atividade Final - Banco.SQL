CREATE DATABASE db_BANCO

CREATE TABLE banco(
   codigo         INT PRIMARY KEY,
   nome           VARCHAR(45),
);

CREATE TABLE agencia(
   numero_agencia INT PRIMARY KEY,
   cod_banco      INT,
   endereco       VARCHAR(45)
);

CREATE TABLE cliente(
   cpf            INT PRIMARY KEY,
   nome           VARCHAR(45),
   sexo           VARCHAR(45),
   endereco       VARCHAR(45)
);

CREATE TABLE conta(
   numero_conta   INT PRIMARY KEY,
   saldo          INT,
   tipo_conta     INT,
   num_agencia    INT
);

CREATE TABLE historico(
   cpf_cliente    INT PRIMARY KEY,
   num_conta      INT,
   data_inicio    VARCHAR(45)
);

CREATE TABLE telefone_cliente(
   cpf_cli        INT PRIMARY KEY,
   telefone       VARCHAR(45)
);

INSERT INTO banco(codigo,nome)
VALUES (1,"Banco do Brasil"),
       (4,"CEF");
       
INSERT INTO agencia(numero_agencia,endereco,cod_banco)
VALUES (0562,"Rua Joaquim Teixeira Alves, 1555",4),
       (3153,"Av. Marcelino Pries, 1960",1);
       
INSERT INTO cliente(cpf,nome,sexo,endereco)
VALUES (11122233344,"Jennifer B. Souza","F","Rua Cuiaba, 1050"),
       (66677788899,"Kaetano K. Lima","M","Rua Ivinhema, 879"),
       (55544477733,"Silvia Marcedo","F","Rua Estados Unidos, 735");
       
INSERT INTO conta(numero_conta,saldo,tipo_conta,num_agencia)
VALUES (863402,763.05,2,3153),
       (235847,3879.12,1,0562);
       
INSERT INTO historico(cpf,num_conta,data_inicio)
VALUES (11122233344,235847,17-12-1997),
       (66677788899,235847,17-12-1997),
       (55544477733,863402,29-11-2010);
       
INSERT INTO telefone_cliente(cpf_cli,telefone_cli)
VALUES (11122233344,"(67)3422-7728"),
       (66677788899,"(67)3423-9900"),
       (66677788899,"(67)8121-8833");
       
-- 04 --
ALTER TABLE cliente
ADD COLUMN email VARCHAR(100);

-- 05 --
SELECT cpf, endereco
FROM cliente
WHERE nome = 'Paulo A Lima';

-- 06 --
SELECT numero_agencia, endereco
FROM agencia
WHERE cod_banco = 1;

-- 07 --
SELECT c.nome, co.numero_conta, co.num_agencia
FROM cliente c
JOIN conta co ON c.cpf = co.cpf_cliente;

-- 08 --
SELECT *
FROM cliente
WHERE sexo = 'M';

-- 09 --
SELECT a.*, b.*
FROM agencia a
JOIN banco b ON a.cod_banco = b.codigo
WHERE a.numero_agencia = 0562;

-- 10 --
DELETE FROM conta
WHERE numero_conta = 863402;

-- 11 --
UPDATE agencia
SET numero_agencia = 6342
WHERE numero_agencia = 0562;

-- 12 --
UPDATE cliente
SET email = 'caetanolima@gmail.com'
WHERE nome = 'Caetano K Lima';

-- 13 --
UPDATE conta
SET saldo = saldo * 1.1
WHERE numero_conta = 235847;
