-- 1. Use o banco de dados restaurante
USE restaurante;

-- 2. Selecionar:
-- Produtos: id, nome e descrição
-- Info_produtos: ingredientes
-- Usando JOIN para combinar produtos e info_produtos
SELECT p.id_produto AS id, p.nome, p.descricao, i.ingrediente
FROM produtos p
JOIN info_produtos i ON p.id_produto = i.id_produto;

-- 3. Selecionar:
-- Pedidos: id, quantidade e data
-- Clientes: nome e email
-- Usando JOIN para combinar pedidos e clientes
SELECT p.id_pedido AS id, p.quantidade, p.data, c.nome, c.email
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente;

-- 4. Selecionar:
-- Pedidos: id, quantidade e data
-- Clientes: nome e email
-- Funcionarios: nome
-- Usando JOIN para combinar pedidos, clientes e funcionários
SELECT p.id_pedido AS id, p.quantidade, p.data, c.nome AS cliente_nome, c.email, f.nome AS funcionario_nome
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN funcionarios f ON p.id_funcionario = f.id_funcionario;

-- 5. Selecionar:
-- Pedidos: id, quantidade e data
-- Clientes: nome e email
-- Funcionarios: nome
-- Produtos: nome, preco
-- Usando JOIN para combinar pedidos, clientes, funcionários e produtos
SELECT p.id_pedido AS id, p.quantidade, p.data, c.nome AS cliente_nome, c.email, f.nome AS funcionario_nome, prod.nome AS produto_nome, prod.preco
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
JOIN produtos prod ON p.id_produto = prod.id_produto;

-- 6. Selecionar o nome dos clientes com os pedidos com status ‘Pendente’ e exibir por ordem descendente de acordo com o id do pedido
SELECT c.nome
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE p.status = 'Pendente'
ORDER BY p.id_pedido DESC;

-- 7. Selecionar clientes sem pedidos
SELECT c.nome, c.email
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

-- 8. Selecionar o nome do cliente e o total de pedidos de cada cliente
SELECT c.nome, COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;

-- 9. Selecionar o preço total (quantidade * preco) de cada pedido
SELECT p.id_pedido, SUM(p.quantidade * prod.preco) AS preco_total
FROM pedidos p
JOIN produtos prod ON p.id_produto = prod.id_produto
GROUP BY p.id_pedido;
