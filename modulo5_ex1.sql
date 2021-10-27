--
-- Exibe uma lista com os títulos dos cursos da Softblue e o tipo de curso ao lado
--
SELECT CURSO.CURSO, TIPO.TIPO FROM CURSO INNER JOIN TIPO ON CURSO.TIPO = TIPO.CODIGO;

--
-- Exiba uma lista com os títulos dos cursos da Softblue, tipo do curso, nome do instrutor responsável pelo mesmo e telefone
--
SELECT CURSO.CURSO, TIPO.TIPO, INSTRUTOR.INSTRUTOR, INSTRUTOR.TELEFONE FROM CURSO INNER JOIN TIPO ON CURSO.TIPO = TIPO.CODIGO INNER JOIN INSTRUTOR ON CURSO.INSTRUTOR = INSTRUTOR.CODIGO;

--
-- Exiba uma lista com o código e data e hora dos pedidos e os códigos dos cursos de cada pedido
--
SELECT CODIGO, DATAHORA, CURSO FROM PEDIDO INNER JOIN PEDIDO_DETALHE ON PEDIDO.CODIGO = PEDIDO_DETALHE.PEDIDO;

--
-- Exiba uma lista com o código e data e hora dos pedidos e os títulos dos cursos de cada pedido
--
SELECT PEDIDO.CODIGO, DATAHORA, CURSO.CURSO FROM PEDIDO INNER JOIN PEDIDO_DETALHE ON PEDIDO.CODIGO = PEDIDO_DETALHE.PEDIDO INNER JOIN CURSO ON PEDIDO_DETALHE.CURSO = CURSO.CODIGO;

--
-- Exiba uma lista com o código e data e hora dos pedidos, nome do aluno e os títulos dos cursos de cada pedido
--
SELECT PEDIDO.CODIGO, DATAHORA, ALUNO.ALUNO, CURSO.CURSO FROM PEDIDO INNER JOIN PEDIDO_DETALHE ON PEDIDO.CODIGO = PEDIDO_DETALHE.PEDIDO INNER JOIN CURSO ON PEDIDO_DETALHE.CURSO = CURSO.CODIGO INNER JOIN ALUNO ON PEDIDO.ALUNO = ALUNO.CODIGO;
