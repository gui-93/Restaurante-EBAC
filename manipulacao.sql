SELECT id_funcionario
FROM funcionarios
ORDER BY id_funcionario;

USE restaurante;
UPDATE funcionarios
SET cargo = 'Garçonete', salario = 2700.00
WHERE cpf = '444.555.666-77';


USE restaurante;
SELECT id_funcionario, nome, cpf
FROM funcionarios
WHERE cpf = '222.333.444-55';


