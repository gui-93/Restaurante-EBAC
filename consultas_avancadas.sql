-- 1. Use o banco de dados restaurante
USE restaurante;

-- 2. Crie uma view chamada resumo_pedido do join entre as tabelas pedidos, clientes, funcionarios e produtos
CREATE VIEW resumo_pedido AS
SELECT 
    p.id AS pedido_id,
    c.nome AS cliente_nome,
    f.nome AS funcionario_nome,
    pr.nome AS produto_nome,
    p.quantidade,
    p.data,
    pr.preco
FROM 
    pedidos p
JOIN 
    clientes c ON p.cliente_id = c.id
JOIN 
    funcionarios f ON p.funcionario_id = f.id
JOIN 
    produtos pr ON p.produto_id = pr.id;

-- 3. Selecione o id do pedido, nome do cliente e o total (quantidade * preco) de cada pedido da view resumo_pedido
SELECT 
    pedido_id,
    cliente_nome,
    (quantidade * preco) AS total
FROM 
    resumo_pedido;

-- 4. Atualiza a view resumo_pedido, adicionando o campo total
CREATE OR REPLACE VIEW resumo_pedido AS
SELECT 
    p.id AS pedido_id,
    c.nome AS cliente_nome,
    f.nome AS funcionario_nome,
    pr.nome AS produto_nome,
    p.quantidade,
    p.data,
    pr.preco,
    (p.quantidade * pr.preco) AS total
FROM 
    pedidos p
JOIN 
    clientes c ON p.cliente_id = c.id
JOIN 
    funcionarios f ON p.funcionario_id = f.id
JOIN 
    produtos pr ON p.produto_id = pr.id;

-- 5. Repita a consulta da questão 3, utilizando o campo total adicionado
SELECT 
    pedido_id,
    cliente_nome,
    total
FROM 
    resumo_pedido;

-- 6. Repita a consulta da pergunta anterior, com uso do EXPLAIN para verificar e compreender o JOIN que está oculto na nossa query
EXPLAIN SELECT 
    pedido_id,
    cliente_nome,
    total
FROM 
    resumo_pedido;

-- 7. Crie uma função chamada ‘BuscaIngredientesProduto’, que irá retornar os ingredientes da tabela info produtos, quando passar o id de produto como argumento (entrada) da função
DELIMITER //
CREATE FUNCTION BuscaIngredientesProduto(produto_id INT)
RETURNS TEXT
BEGIN
    DECLARE ingredientes TEXT;
    SELECT GROUP_CONCAT(ingrediente SEPARATOR ', ') INTO ingredientes
    FROM info_produtos
    WHERE produto_id = produto_id;
    RETURN ingredientes;
END //
DELIMITER ;

-- 8. Execute a função ‘BuscaIngredientesProduto’ com o id de produto 10
SELECT BuscaIngredientesProduto(10);

-- 9. Crie uma função chamada ‘mediaPedido’ que irá retornar uma mensagem dizendo que o total do pedido é acima, abaixo ou igual a média de todos os pedidos, quando passar o id do pedido como argumento da função
DELIMITER //
CREATE FUNCTION mediaPedido(pedido_id INT)
RETURNS VARCHAR(100)
BEGIN
    DECLARE media_total DECIMAL(10, 2);
    DECLARE total_pedido DECIMAL(10, 2);
    DECLARE resultado VARCHAR(100);

    -- Calcula a média dos totais dos pedidos
    SELECT AVG(total) INTO media_total
    FROM resumo_pedido;

    -- Obtém o total do pedido específico
    SELECT total INTO total_pedido
    FROM resumo_pedido
    WHERE pedido_id = pedido_id;

    -- Compara e define a mensagem
    IF total_pedido > media_total THEN
        SET resultado = 'O total do pedido é acima da média.';
    ELSEIF total_pedido < media_total THEN
        SET resultado = 'O total do pedido é abaixo da média.';
    ELSE
        SET resultado = 'O total do pedido é igual à média.';
    END IF;

    RETURN resultado;
END //
DELIMITER ;

-- 10. Execute a função ‘mediaPedido’ com o id de pedido 5 e depois 6
SELECT mediaPedido(5);
SELECT mediaPedido(6);
