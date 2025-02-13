-- Use o banco de dados restaurante
USE restaurante;

-- 1. Calcular a quantidade de pedidos
SELECT COUNT(*) AS quantidade_pedidos
FROM pedidos;

-- 2. Calcular a quantidade de clientes únicos que realizaram pedidos
SELECT COUNT(DISTINCT id_cliente) AS quantidade_clientes_unicos
FROM pedidos;

-- 3. Calcular a média de preço dos produtos
SELECT AVG(preco) AS media_preco
FROM produtos;

-- 4. Calcular o mínimo e máximo do preço dos produtos
SELECT MIN(preco) AS preco_minimo, MAX(preco) AS preco_maximo
FROM produtos;

-- 5. Selecionar o nome e o preço do produto e fazer um rank dos 5 produtos mais caros
SELECT nome, preco
FROM produtos
ORDER BY preco DESC
LIMIT 5;

-- 6. Selecionar a média dos preços dos produtos agrupados por categoria
SELECT categoria, AVG(preco) AS media_preco_categoria
FROM produtos
GROUP BY categoria;

-- 7. Selecionar o fornecedor e a quantidade de produtos que vieram daquele fornecedor da informações de produtos
SELECT fornecedor, COUNT(*) AS quantidade_produtos
FROM produtos
GROUP BY fornecedor;

-- 8. Selecionar os fornecedores que possuem mais de um produto cadastrado
SELECT fornecedor
FROM produtos
GROUP BY fornecedor
HAVING COUNT(*) > 1;

-- 9. Selecionar os clientes que realizaram apenas 1 pedido
SELECT c.id_cliente, c.nome
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING COUNT(p.id_pedido) = 1;
