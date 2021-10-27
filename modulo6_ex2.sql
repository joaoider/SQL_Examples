--
-- Utilizando subquery, exiba uma lista com os nomes dos cursos disponibilizados pela Softblue informando para cada curso qual o seu menor valor de venda já praticado.
--
SELECT CURSO, (SELECT MIN(VALOR) FROM PEDIDO_DETALHE WHERE PEDIDO_DETALHE.CURSO = CURSO.CODIGO) AS MENOR_VALOR FROM CURSO;

--
-- Utilizando subquery e o parâmetro IN, exiba os nomes dos cursos disponibilizados pela Softblue cujo tipo de curso seja 'Programação'.
--
SELECT CURSO FROM CURSO WHERE TIPO IN (SELECT CODIGO FROM TIPO WHERE TIPO = 'Programação');

--
-- Utilizando subquery e o parâmetro EXISTS, exiba novamente os nomes dos cursos disponibilizados pela Softblue cujo tipo de curso seja 'Programação'.
--
SELECT CURSO FROM CURSO WHERE EXISTS (SELECT CODIGO FROM TIPO WHERE TIPO.CODIGO = CURSO.TIPO AND TIPO.TIPO = 'Programação');

--
-- Exiba uma lista com os nomes dos instrutores da Softblue e ao lado o total acumulado das vendas referente aos cursos pelo qual o instrutor é responsável.
--
SELECT INSTRUTOR, (SELECT SUM(PEDIDO_DETALHE.VALOR) FROM PEDIDO_DETALHE INNER JOIN CURSO ON PEDIDO_DETALHE.CURSO = CURSO.CODIGO WHERE CURSO.INSTRUTOR = INSTRUTOR.CODIGO) AS TOTAL_DE_VENDAS FROM INSTRUTOR;

--
-- Crie uma visão que exiba os nomes dos alunos e quanto cada um já comprou em cursos
--
CREATE VIEW ALUNOS_E_COMPRAS AS SELECT ALUNO, (SELECT SUM(PEDIDO_DETALHE.VALOR) FROM PEDIDO_DETALHE INNER JOIN PEDIDO ON PEDIDO_DETALHE.PEDIDO = PEDIDO.CODIGO WHERE PEDIDO.ALUNO = ALUNO.CODIGO) AS TOTAL_DE_COMPRAS FROM ALUNO;