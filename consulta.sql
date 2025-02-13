-- Use o banco de dados restaurante
USE restaurante;

-- Selecionar o nome e a categoria dos produtos que têm o preço superior a 30
SELECT nome, categoria
FROM produtos
WHERE preco > 30;

-- Selecionar o nome, telefone e data de nascimento dos clientes que nasceram antes do ano de 1985
SELECT nome, telefone, data_nascimento
FROM clientes
WHERE YEAR(data_nascimento) < 1985;

-- Selecionar o id do produto e os ingredientes de informações de produto para os ingredientes que contenham a palavra “carne”
SELECT p.id_produto, pi.ingrediente
FROM produtos p
JOIN produto_ingredientes pi ON p.id_produto = pi.id_produto
WHERE pi.ingrediente LIKE '%carne%';

-- Selecionar o nome e a categoria dos produtos ordenados em ordem alfabética por categoria, e para cada categoria ordenados pelo nome do produto
SELECT nome, categoria
FROM produtos
ORDER BY categoria, nome;

-- Selecionar os 5 produtos mais caros do restaurante
SELECT nome, preco
FROM produtos
ORDER BY preco DESC
LIMIT 5;

-- A cada dia da semana 2 pratos principais estão na promoção; hoje selecione 2 produtos da categoria ‘Prato Principal’ e pule 6 registros (offset = 5)
SELECT nome, preco
FROM produtos
WHERE categoria = 'Prato Principal'
ORDER BY nome
LIMIT 2 OFFSET 5;

-- Fazer backup dos dados da tabela pedidos com o nome de backup_pedidos
CREATE TABLE backup_pedidos AS
SELECT * FROM pedidos;
