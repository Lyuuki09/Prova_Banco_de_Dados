-- Criação do banco de dados
CREATE DATABASE CafeteriaDB;
GO
USE CafeteriaDB;
GO

-- Criação da tabela de Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY IDENTITY,
    nome NVARCHAR(50) NOT NULL,
    email NVARCHAR(50) NOT NULL
);

-- Criação da tabela de Pedidos
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY IDENTITY,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Criação da tabela de Itens de Pedido
CREATE TABLE ItensPedido (
    IDItem INT PRIMARY KEY IDENTITY,
    pedido_id INT NOT NULL,
    produto NVARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id)
);

-- Inserindo dados na tabela de clientes
INSERT INTO Clientes (nome, email) VALUES
(N'Ana Ferreira', N'ana.ferreira@email.com'),
(N'Luiz Costa', N'luiz.costa@email.com'),
(N'Fernanda Lima', N'fernanda.lima@email.com');

-- Inserindo dados na tabela de pedidos
INSERT INTO Pedidos (cliente_id, data_pedido, total) VALUES
(1, '2024-11-01', 45.00),
(2, '2024-11-02', 32.00),
(3, '2024-11-03', 28.50),
(1, '2024-11-04', 55.00),
(2, '2024-11-05', 15.00);

-- Inserindo dados na tabela de itens de Pedido
INSERT INTO ItensPedido (pedido_id, produto, quantidade, preco) VALUES
(1, N'Café Expresso', 2, 5.00),
(1, N'Bolo de Chocolate', 1, 25.00),
(2, N'Café com Leite', 1, 8.00),
(2, N'Croissant', 2, 6.00),
(3, N'Sanduíche Natural', 1, 15.00),
(3, N'Suco de Laranja', 1, 6.50),
(4, N'Chá Verde', 2, 6.00),
(4, N'Pão de Queijo', 3, 7.00),
(5, N'Capuccino', 1, 10.00),
(5, N'Biscoito Integral', 1, 5.00);

-- EX1. view
CREATE VIEW vw_PedidosClientes AS
SELECT
    p.pedido_id,
    c.nome AS cliente_nome,
    p.data_pedido,
    p.total
FROM
    Pedidos p
JOIN
    Clientes c ON p.cliente_id = c.cliente_id;

-- EX2. Subquery
SELECT
    c.nome,
    (SELECT SUM(p.total)
     FROM Pedidos p
     WHERE p.cliente_id = c.cliente_id) AS total_vendas
FROM
    Clientes c
WHERE
    c.nome = N'Ana Ferreira';

-- EX3. cte
WITH TotalItensPorPedido AS (
    SELECT
        pedido_id,
        SUM(quantidade) AS total_itens
    FROM
        ItensPedido
    GROUP BY
        pedido_id
)
SELECT
    p.pedido_id,
    c.nome AS cliente_nome,
    p.data_pedido,
    TotalItensPorPedido.total_itens
FROM
    Pedidos p
JOIN
    Clientes c ON p.cliente_id = c.cliente_id
JOIN
    TotalItensPorPedido ON p.pedido_id = TotalItensPorPedido.pedido_id;

-- EX4. Window Functions
SELECT
    p.pedido_id,
    c.nome AS cliente_nome,
    p.data_pedido,
    p.total,
    SUM(p.total) OVER (ORDER BY p.data_pedido) AS total_acumulado
FROM
    Pedidos p
JOIN
    Clientes c ON p.cliente_id = c.cliente_id
ORDER BY
    p.data_pedido;

-- EX5. Functions
CREATE FUNCTION fn_TotalPedido (@pedido_id INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @total DECIMAL(10, 2);
    SELECT @total = SUM(preco * quantidade)
    FROM ItensPedido
    WHERE pedido_id = @pedido_id;
    RETURN @total;
END;

-- EX6. Loops
DECLARE @i INT = 1;
WHILE @i <= 5
BEGIN
    INSERT INTO ItensPedido (pedido_id, produto, quantidade, preco)
    VALUES (1, N'Produto Repetido', 1, 10.00);
    SET @i = @i + 1;
END;

-- EX7. Procedures
CREATE PROCEDURE sp_InserirPedido
    @cliente_id INT,
    @data_pedido DATE,
    @itens NVARCHAR(MAX) 
AS
BEGIN
    DECLARE @pedido_id INT;
    INSERT INTO Pedidos (cliente_id, data_pedido, total)
    VALUES (@cliente_id, @data_pedido, 0);
    SET @pedido_id = SCOPE_IDENTITY();
    DECLARE @json NVARCHAR(MAX) = @itens;
    INSERT INTO ItensPedido (pedido_id, produto, quantidade, preco)
    SELECT @pedido_id, produto, quantidade, preco
    FROM OPENJSON(@json)
    WITH (
        produto NVARCHAR(50),
        quantidade INT,
        preco DECIMAL(10, 2)
    );
    UPDATE Pedidos
    SET total = (SELECT SUM(preco * quantidade) FROM ItensPedido WHERE pedido_id = @pedido_id)
    WHERE pedido_id = @pedido_id;
END;

-- EX8. Triggers
CREATE TRIGGER trg_AtualizarTotalPedido
ON ItensPedido
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @pedido_id INT;
    SELECT @pedido_id = pedido_id FROM inserted;
    UPDATE Pedidos
    SET total = (SELECT SUM(preco * quantidade) FROM ItensPedido WHERE pedido_id = @pedido_id)
    WHERE pedido_id = @pedido_id;
END;