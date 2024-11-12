CREATE DATABASE longa_vida;

USE longa_vida;

CREATE TABLE plano(
Numero CHAR(2) NOT NULL,
Descricao CHAR(30),
Valor DECIMAL(10,2),
PRIMARY KEY (Numero));

USE longa_vida;

INSERT INTO plano(Numero, Descricao, Valor)
VALUES('B1', 'BASICO 1', 200);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('B2', 'BASICO 2', 150);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('B3', 'BASICO 3', 100);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('E1', 'EXECUTIVO 1', 350);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('E2', 'EXECUTIVO 2', 300);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('E3', 'EXECUTIVO 3', 250);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('M1', 'MASTER 1', 500);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('M2', 'MASTER 2', 450);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('M3', 'MASTER 3', 500);

CREATE TABLE associado(
Plano CHAR(2) NOT NULL,
Nome CHAR(40) NOT NULL,
Endereço CHAR(35),
Cidade CHAR(20),
Estado CHAR(2),
CEP CHAR(9),
PRIMARY KEY(Nome)
);

USE longa_vida;
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B1', 'JOSE ANTONIO DA SILVA', 'R. FELIPE DO AMARAL, 3450', 'COTIA', 'SP', '06700-000');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B1', 'MARIA DA SILVA SOBRINHO', 'R. FELIPE DE JESUS, 1245', 'DIADEMA', 'SP', '09960-170');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B1', 'PEDRO JOSE DE OLIVEIRA', 'R. AGRIPINO DIAS, 155', 'COTIA', 'SP', '06700-011');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B2', 'ANTONIA DE FERNANDES', 'R. PE EZEQUIEL, 567', 'DIADEMA', 'SP', '09960-175');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B2', 'ANTONIO DO PRADO', 'R. INDIO TABAJARA, 55', 'GUARULHOS', 'SP', '07132-999');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B3', 'WILSON SENA', 'R. ARAPIRACA, 1234', 'OSASCO', 'SP', '06293-001');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B3', 'SILVIA DE ABREU', 'R. DR JOAO DA SILVA, 5', 'SANTO ANDRE', 'SP', '09172-112');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E1', 'ODETE DA CONCEICAO', 'R. VOLUNTARIOS DA PATRIA, 10', 'SAO PAULO', 'SP', '02010-550');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E2', 'JOAO CARLOS MACEDO', 'R. VISTA ALEGRE, 500', 'SAO PAULO', 'SP', '04343-990');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'CONCEICAO DA SILVA', 'AV. VITORINO DO AMPARO, 11', 'MAUA', 'SP', '09312-998');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'PAULO BRUNO AMARAL', 'R. ARGENZIO BRILHANTE, 88', 'BARUERI', 'SP', '06460-990');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'WALDENICE DE OLIVEIRA', 'R. OURO VELHO, 12', 'BARUERI', 'SP', '06460-998');

UPDATE associado
SET CEP = '06460-999'
WHERE Nome = 'PAULO BRUNO AMARAL';

INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'MARCOS DO AMARAL', 'R. DO OUVIDOR, 67', 'GUARULHOS', 'SP', '07031-555');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'MURILO DE SANTANA', 'R.PRATA DA CASA', 'BARUERI', 'SP', '06455-111');

UPDATE associado
SET Endereço = 'R. PRATA DA CASA'
WHERE Nome = 'MURILO DE SANTANA';

ALTER TABLE associado
RENAME COLUMN Endereço TO Endereco;

UPDATE associado
SET Plano = 'M1'
WHERE Nome = 'MURILO DE SANTANA';

INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('M1', 'LUIZA ONOFRE FREITAS', 'R. VICENTE DE ABREU, 55', 'SANTO ANDRE', 'SP', '09060-667');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('M2', 'MELISSA DE ALMEIDA', 'R. FERNANDO ANTONIO, 2345', 'SAO PAULO', 'SP', '04842-987');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('M2', 'JOAO INACIO DA CONCEICAO', 'R. PENELOPE CHARMOSA, 34', 'SUZANO', 'SP', '08670-888');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('B3', 'AUGUSTA DE ABREU', 'AV. RIO DA SERRA, 909', 'SANTO ANDRE', 'SP', '09061-333');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('B3', 'ILDA DE MELO DA CUNHA', 'AV. POR DO SOL, 546', 'SANTO ANDRE', 'SP', '09199-444');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('B3', 'MARCOS DA CUNHA', 'AV. PEDROSO DE MORAES, 546', 'SAO PAULO', 'SP', '04040-444');

SELECT * FROM associado;

--2--
SELECT * 
FROM plano 
INNER JOIN associado
ON associado.Plano = plano.Numero;

--3--
SELECT COUNT(Plano) AS QTDE_B1 
FROM associado
WHERE Plano = 'B1';

--4--
SELECT associado.Nome, associado.Plano, 
CONCAT('R$ ', FORMAT(plano.Valor, 2)) AS Valor 
FROM associado
INNER JOIN plano 
ON associado.Plano = plano.Numero;

--5--
SELECT Nome, Cidade 
FROM associado
WHERE Cidade = 'cotia' OR Cidade = 'diadema';

--6--
SELECT associado.Nome, associado.Plano, 
CONCAT('R$ ', FORMAT(plano.Valor,2)) AS Valor,
associado.Cidade 
FROM associado
INNER JOIN plano
ON associado.Plano = plano.Numero
WHERE associado.Cidade = 'barueri' 
AND associado.plano = 'M1';

--7--
SELECT associado.Nome, associado.Plano, 
CONCAT('R$ ', FORMAT(plano.Valor,2)) AS Valor,
associado.Cidade
FROM associado
INNER JOIN plano
ON associado.Plano = plano.Numero
WHERE associado.Cidade = 'sao paulo';

--8--
SELECT * FROM associado 
INNER JOIN plano
ON associado.plano = plano.numero
WHERE Nome LIKE '%silva%'

--9--
UPDATE plano
SET Valor = Valor * 1.1
WHERE Numero LIKE '%B%';

USE longa_vida;
UPDATE plano
SET Valor = Valor * 1.05
WHERE Numero LIKE '%E%';

USE longa_vida;
UPDATE plano
SET Valor = Valor * 1.03
WHERE Numero LIKE '%M%';

SELECT Valor, Numero 
FROM plano;

--10--
UPDATE associado
SET plano = 'E3'
WHERE Nome = 'PEDRO JOSE DE OLIVEIRA';

SELECT * FROM associado 
INNER JOIN plano 
ON associado.Plano = plano.Numero;

--11--
SELECT COUNT(Nome) AS Qtde_E3 
FROM associado
WHERE Plano = 'E3';

--12--
SELECT associado.Nome, plano.Valor 
FROM associado
INNER JOIN plano 
ON associado.Plano = plano.Numero
WHERE (associado.Plano = 'B1' 
OR associado.Plano = 'E1' 
OR associado.Plano = 'M1')
GROUP BY associado.Nome;

--13--
SELECT Nome, Plano 
from associado
WHERE Plano LIKE 'E%';

--14--
SELECT Nome 
FROM associado
WHERE Plano LIKE 'B%' 
OR Plano LIKE 'M%';

--15--
DELETE 
FROM associado 
WHERE Cidade = 'santo andre';

SELECT * FROM associado;

--16--
SELECT associado.Nome, associado.Plano, 
CONCAT('R$ ', FORMAT(plano.Valor,2)) AS Valor 
FROM associado
INNER JOIN plano
ON associado.Plano = plano.Numero
WHERE (associado.Cidade = 'sao paulo' 
AND associado.plano = 'm2') 
OR (associado.Cidade = 'sao paulo' 
AND associado.plano = 'm3')
ORDER BY Nome;

select plano, nome from associado;

-- corrigindo o plano de MARCOS DA CUNHA
UPDATE associado
SET Plano = 'M3'
WHERE Nome = 'MARCOS DA CUNHA';

--17--
SELECT * FROM associado 
INNER JOIN plano
ON associado.Plano = plano.Numero 
ORDER BY plano.Numero;

--18--
SELECT * 
FROM associado 
INNER JOIN plano
ON associado.Plano = plano.Numero
ORDER BY associado.Plano ASC, 
         associado.Nome DESC;

--19--
SELECT * 
FROM associado
WHERE Plano NOT LIKE 'm%';

--20--
SELECT associado.Nome, plano.Descricao 
FROM associado
INNER JOIN plano
ON associado.Plano = plano.Numero
ORDER BY associado.Nome ASC;

--21--
SELECT Valor 
FROM plano
WHERE Valor >= 300 AND Valor <= 500;

--22--
SELECT associado.Nome, associado.Plano, 
       plano.Descricao, 
       CONCAT('R$ ', FORMAT(plano.Valor,2)) AS Valor 
FROM associado
INNER JOIN plano
ON associado.Plano = plano.Numero
WHERE NOME LIKE '%amaral%';

--23--
SELECT Nome 
FROM associado
WHERE Cidade = 'Diadema';

--24--
UPDATE plano
SET Valor = Valor * 1.06
WHERE Numero LIKE 'M%';

--25--
SELECT Nome 
FROM associado
WHERE CEP LIKE '09%';
