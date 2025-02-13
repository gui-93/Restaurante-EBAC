-- Use o banco de dados restaurante
USE restaurante;

-- 1. Selecionar todos os pedidos cujo id funcionário é igual a 4 e status é igual a 'Pendente'
SELECT *
FROM pedidos
WHERE id_funcionario = 4 AND status = 'Pendente';

-- 2. Selecionar todos os pedidos cujo status não é igual a 'Concluído'
SELECT *
FROM pedidos
WHERE status <> 'Concluído';

-- 3. Selecionar os pedidos que contenham os id produtos: 1, 3, 5, 7 ou 8
SELECT *
FROM pedidos
WHERE id_produto IN (1, 3, 5, 7, 8);

-- 4. Selecionar os clientes cujo nome começa com a letra 'C'
SELECT *
FROM clientes
WHERE nome LIKE 'C%';

-- 5. Selecionar as informações de produtos que contenham nos ingredientes 'carne' ou 'frango'
SELECT p.*
FROM produtos p
JOIN produto_ingredientes pi ON p.id_produto = pi.id_produto
WHERE pi.ingrediente LIKE '%carne%' OR pi.ingrediente LIKE '%frango%';

-- 6. Selecionar os produtos com o preço entre 20 e 30
SELECT *
FROM produtos
WHERE preco BETWEEN 20 AND 30;

-- 7. Atualizar id pedido 6 da tabela pedidos para status = NULL
UPDATE pedidos
SET status = NULL
WHERE id_pedido = 6;

-- 8. Selecionar os pedidos com status nulos
SELECT *
FROM pedidos
WHERE status IS NULL;

-- 9. Selecionar o id pedido e o status da tabela pedidos, porém para todos os status nulos, mostrar 'Cancelado'
SELECT id_pedido, 
       COALESCE(status, 'Cancelado') AS status
FROM pedidos;

-- 10. Selecionar o nome, cargo, salário dos funcionários e adicionar um campo chamado media_salario
-- que mostra 'Acima da média' para salários > 3000, senão 'Abaixo da média'
SELECT nome, cargo, salario,
       CASE 
           WHEN salario > 3000 THEN 'Acima da média'
           ELSE 'Abaixo da média'
       END AS media_salario
FROM funcionarios;
