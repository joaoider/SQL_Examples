-- 
-- Selecione os nomes de todos os alunos que já fizeram alguma matrícula na Softblue, sem repetição.
--
SELECT DISTINCT(ALUNO.ALUNO) FROM PEDIDO INNER JOIN ALUNO ON PEDIDO.ALUNO = ALUNO.CODIGO;

-- 
-- Exiba o nome do aluno mais antigo da Softblue
--
SELECT DISTINCT(ALUNO.ALUNO) FROM PEDIDO INNER JOIN ALUNO ON PEDIDO.ALUNO = ALUNO.CODIGO ORDER BY DATAHORA ASC LIMIT 1;

-- 
-- Exiba o nome do aluno mais recente da Softblue
--
SELECT DISTINCT(ALUNO.ALUNO) FROM PEDIDO INNER JOIN ALUNO ON PEDIDO.ALUNO = ALUNO.CODIGO ORDER BY DATAHORA DESC LIMIT 1;

-- 
-- Exiba o nome do terceiro aluno mais antigo da Softblue
--
SELECT DISTINCT(ALUNO.ALUNO) FROM PEDIDO INNER JOIN ALUNO ON PEDIDO.ALUNO = ALUNO.CODIGO ORDER BY DATAHORA ASC LIMIT 1 OFFSET 2;

-- 
-- Exiba a quantidade de cursos que já foram vendidos pela Softblue
--
SELECT COUNT(*) FROM PEDIDO_DETALHE;

-- 
-- Exiba o valor total já arrecadado pelos cursos vendidos pela Softblue
--
SELECT SUM(VALOR) FROM PEDIDO_DETALHE;

-- 
-- Exiba o valor médio cobrado por curso para o pedido cujo CODIGO é 2
--
SELECT AVG(VALOR) FROM PEDIDO_DETALHE WHERE PEDIDO = 2;

-- 
-- Exiba o valor do curso mais caro da Softblue
--
SELECT MAX(VALOR) FROM CURSO;

-- 
-- Exiba o valor do curso mais barato da Softblue
--
SELECT MIN(VALOR) FROM CURSO;

-- 
-- Exiba o valor total de cada pedido realizado na Softblue
--
SELECT PEDIDO, SUM(VALOR) FROM PEDIDO_DETALHE GROUP BY PEDIDO;

-- 
-- Exiba os nomes dos instrutores da Softblue e a quantidade de cursos que cada um tem sob sua responsabilidade
--
SELECT INSTRUTOR.INSTRUTOR, COUNT(*) FROM CURSO INNER JOIN INSTRUTOR ON CURSO.INSTRUTOR = INSTRUTOR.CODIGO GROUP BY INSTRUTOR;

-- 
-- Exiba o número do pedido, nome do aluno e valor para todos os pedidos realizados  na Softblue cujo valor total sejam maiores que 500
--
SELECT PEDIDO, ALUNO.ALUNO, SUM(VALOR) FROM PEDIDO_DETALHE INNER JOIN PEDIDO ON PEDIDO_DETALHE.PEDIDO = PEDIDO.CODIGO INNER JOIN ALUNO ON PEDIDO.ALUNO = ALUNO.CODIGO GROUP BY PEDIDO HAVING SUM(VALOR) > 500;

-- 
-- Exiba o número do pedido, nome do aluno e quantos cursos foram comprados no pedido para todos os pedidos realizados na Softblue que compraram dois ou mais cursos.
--
SELECT PEDIDO, ALUNO.ALUNO, COUNT(*) FROM PEDIDO_DETALHE INNER JOIN PEDIDO ON PEDIDO_DETALHE.PEDIDO = PEDIDO.CODIGO INNER JOIN ALUNO ON PEDIDO.ALUNO = ALUNO.CODIGO GROUP BY PEDIDO HAVING COUNT(*) > 1;

-- 
-- Exiba o nome e endereço de todos os alunos que morem em Avenidas (Av.)
--
SELECT ALUNO, ENDERECO FROM ALUNO WHERE ENDERECO LIKE 'Av%';

-- 
-- Exiba os nomes dos cursos de Java da Softblue
--
SELECT CURSO FROM CURSO WHERE CURSO LIKE '%java%';

