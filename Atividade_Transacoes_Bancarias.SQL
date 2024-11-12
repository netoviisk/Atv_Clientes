CREATE DATABASE Transacoes_Bancarias;

CREATE TABLE aplicacoes(
   apl_conta        INT PRIMARY KEY AUTO_INCREMENT,
   apl_tipo         VARCHAR(45),
   apl_valor        INT,
   fk_apl_con_conta INT
);

CREATE TABLE conta(
   con_conta        INT PRIMARY KEY AUTO_INCREMENT,
   con_nome         VARCHAR(45),
   con_agencia      INT,
   con_saldo        INT
);

CREATE TABLE cartoes(
   car_conta        INT PRIMARY KEY AUTO_INCREMENT,
   car_cartao       BIGINT,
   car_tipo         VARCHAR(45),
   car_limite       INT,
   car_fatura       INT
   fk_car_con_conta INT,
);

CREATE TABLE operacoes(
   ope_conta        INT PRIMARY KEY AUTO_INCREMENT,
   ope_descricao    VARCHAR(45),
   ope_valor        INT
   fk_ope_con_conta INT,
);

-- FK --
ALTER TABLE aplicacoes
ADD CONSTRAINT fk_APL_con_conta FOREIGN KEY(fk_apl_con_conta) REFERENCES conta(con_conta);

ALTER TABLE cartoes
ADD CONSTRAINT fk_CAR_con_conta FOREIGN KEY(fk_car_con_conta) REFERENCES conta(con_conta);

ALTER TABLE operacoes
ADD CONSTRAINT fk_OPE_con_conta FOREIGN KEY(fk_ope_con_conta) REFERENCES conta(con_conta);

-- CL1 --
INSERT INTO aplicacoes(apl_conta,apl_tipo,apl_valor,fk_apl_con_conta)
VALUES ("",,);
 
INSERT INTO conta(con_conta,con_nome,con_agencia,con_saldo)
VALUES ("Bradensco",88655534,800.00);

INSERT INTO cartoes(car_conta,car_cartao,car_tipo,car_limite,car_fatura,fk_car_con_conta)
VALUES (7867 9322 0098,"BLACK",1000.00,550.00,1);

INSERT INTO operacoes(ope_conta,ope_descricao,ope_valor,fk_ope_con_conta)
VALUES ("",,);

-- CL2 --
INSERT INTO aplicacoes(apl_conta,apl_tipo,apl_valor,fk_apl_con_conta)
VALUES ("",,);
 
INSERT INTO conta(con_conta,con_nome,con_agencia,con_saldo)
VALUES ("Itaú",995632109,220.00);

INSERT INTO cartoes(car_conta,car_cartao,car_tipo,car_limite,car_fatura,fk_car_con_conta)
VALUES (1298 8875 7676,"PURPLE",1050.00,250.00,2);

INSERT INTO operacoes(ope_conta,ope_descricao,ope_valor,fk_ope_con_conta)
VALUES ("",,);

-- CL3 --
INSERT INTO aplicacoes(apl_conta,apl_tipo,apl_valor,fk_apl_con_conta)
VALUES ("",,);
 
INSERT INTO conta(con_conta,con_nome,con_agencia,con_saldo)
VALUES ("Itaú",76789234,22.000.50);

INSERT INTO cartoes(car_conta,car_cartao,car_tipo,car_limite,car_fatura,fk_car_con_conta)
VALUES (5109 8845 6278,"BLACK MASTER",8000.00,1560.00,3);

INSERT INTO operacoes(ope_conta,ope_descricao,ope_valor,fk_ope_con_conta)
VALUES ("",,);

-- OT --
SET @@autocommit = OFF;

-- 1 --
INSERT INTO operacoes(ope_conta,ope_descricao,ope_valor,fk_ope_con_conta)
VALUES ("Saque",100.00,1);

START TRANSACTION
   UPDATE conta
   SET con_saldo = 700.00
   WHERE con_conta = 1;
COMMIT;

-- 2 --
INSERT INTO operacoes(ope_conta,ope_descricao,ope_valor,fk_ope_con_conta)
VALUES ("PIX",50.00,2);

START TRANSACTION
   UPDATE conta
   SET    con_saldo = 170.00
   WHERE  con_conta = 2;
COMMIT;

-- 3 --
INSERT INTO operacoes(ope_conta,ope_descricao,ope_valor,fk_ope_con_conta)
VALUES ("Pagamento de Fatura",120.00,2);

START TRANSACTION
   UPDATE conta
   SET    con_saldo = 50.00
   WHERE  con_conta = 2;
   
   UPDATE cartoes
   SET    car_fatura = 80
   WHERE  fk_car_con_conta = 2
COMMIT;

-- 4 --
INSERT INTO aplicacoes(apl_conta,apl_tipo,apl_valor,fk_apl_con_conta)
VALUES ("Investimentos",2000.00,3);

INSERT INTO operacoes(ope_conta,ope_descricao,ope_valor,fk_ope_con_conta)
VALUES ("Pagamento",2000.00,3);

START TRANSACTION
   UPDATE conta
   SET    con_saldo = 17.000.00
   WHERE  con_conta = 3;
COMMIT;

-- 5 --
INSERT INTO aplicacoes(apl_conta,apl_tipo,apl_valor,fk_apl_con_conta)
VALUES ("Investimentos",500.00,3);

INSERT INTO operacoes(ope_conta,ope_descricao,ope_valor,fk_ope_con_conta)
VALUES ("Faturamento",500.00,3);

START TRANSACTION
   UPDATE conta
   SET    con_saldo = 17.500.00
   WHERE  con_conta = 3;
COMMIT;