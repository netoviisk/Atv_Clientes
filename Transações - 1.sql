CREATE DATABASE db_transacao;

CREATE TABLE dados_livro(
   codigolivro INT PRIMARY KEY AUTO_INCREMENT,
   nomelivro   VARCHAR(45),
   isbn13      VARCHAR(45),
   preçolivro  VARCHAR(45)
)

INSERT INTO dados_livro(nomelivro,isbn13,preçolivro)
VALUES ("Raimundo Neto","12","45.00");
INSERT INTO dados_livro(nomelivro,isbn13,preçolivro)
VALUES ("Piroquio","3","70.00");
INSERT INTO dados_livro(nomelivro,isbn13,preçolivro)
VALUES ("Holocaust","11","35.00");

SELECT *
FROM dados_livro;

SET @@autocommit = OFF;

START TRANSACTION;
   DELETE FROM dados_livro;
   
   INSERT INTO dados_livro(nomelivro,isbn13,preçolivro)
   VALUES ("Ciência da Computação","3125135123","70.00");

   SELECT *
   FROM dados_livro;
   
ROLLBACK;

CREATE PROCEDURE insere_dados()
BEGIN
DECLARE erro_sql TINYINT DEFAULT FALSE;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro_sql = TRUE;
START TRANSWACTION;
INSERT INTO dados_livro (nome_livro,isbn13,preçolivro)
VALUES ("HISTORIA","12312312","80.00"),
       ("FISICA","12412312","80.00"),
       ("QUIMICA","22312312","80.00");
       IF erro_sql = FALSE THEN
       COMMIT;
       SELECT "Transação efetivada com sucesso" AS Resultado;
       ELSE
       ROLLBACK;
       SELECT "Erro na transação" AS Resultado;
       END IF;
       END;