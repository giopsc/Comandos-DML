-- AGRAGAÇÕES 

SELECT COUNT(*) FROM PRODUCT_RM988837; --32951 REGISTROS NA BASE

SELECT * FROM customers_rm988837;

SELECT COUNT (DISTINCT customer_city) FROM customers_rm988837; --4119 cidades diferentes

SELECT DISTINCT customer_state FROM customers_rm988837; --27 ESTADOS

SELECT DISTINCT customer_state
    FROM customers_rm988837
        ORDER BY customer_state; -- Ordenação padrão A-Z
        
SELECT DISTINCT customer_state
    FROM customers_rm988837
        ORDER BY customer_state DESC; -- Ordenação descendente Z-A
        
SELECT customer_state, COUNT (*) as quantidade_clientes
    FROM customers_rm988837
        GROUP BY customer_state
            ORDER BY customer_state; -- Selecionar a quantidade de clientes por estado
            
SELECT customer_state, COUNT (*) as quantidade_clientes
    FROM customers_rm988837
        GROUP BY customer_state
            ORDER BY customer_state; -- Ordenar por estado
                
SELECT customer_state, COUNT (*) as quantidade_clientes
    FROM customers_rm988837
        GROUP BY customer_state
                ORDER BY 2; -- Ordenar por quantidade de clientes
                
SELECT customer_city, COUNT (*) as quantidade_clientes
    FROM customers_rm988837
    WHERE customer_state = 'SP'
        GROUP BY customer_city
            ORDER BY customer_city; -- Quantidade de clientes de SP
                
SELECT customer_city, customer_state, COUNT (*) as quantidade_clientes
    FROM customers_rm988837
        GROUP BY customer_city, customer_state
            ORDER BY customer_state, customer_city; -- Quantidade de clientes por cidade/estado
            
SELECT customer_city, customer_state, COUNT (*) as quantidade_clientes
    FROM customers_rm988837
        GROUP BY customer_city, customer_state HAVING COUNT(*) > 1000
            ORDER BY customer_state, customer_city; -- Quantidade de clientes por cidade/estado, 
                                                    -- só com mais de 1000 clientes
                
SELECT INITCAP(customer_city), COUNT (*) as quantidade_clientes
    FROM customers_rm988837
    WHERE customer_state = 'SP'
        GROUP BY customer_city
            ORDER BY customer_city; -- Primeira letra em maiúscula, quantidade de clientes por cidade somente em SP
                
SELECT COUNT(*), 
    COUNT(DISTINCT customer_city) AS total_cidades, 
        COUNT(DISTINCT customer_state) AS total_estados
            FROM customers_rm988837; -- Contar totatis de cidade, estado, e clientes (registros)
                       
SELECT SUM(price) AS total_price
    FROM order_itens_rm988837; -- Preço somado de todos os produtos 
    
SELECT data_limite, 
    SUM(price) AS total_vendas,
    MIN(price) AS venda_minima,
    MAX(price) AS venda_maxima,
    COUNT(*) AS quantidade
        FROM order_itens_rm988837
            GROUP BY data_limite
                ORDER BY data_limite; -- 
                
SELECT * 
    FROM orders_rm988837
    WHERE customer_id
        IN (SELECT customer_id 
             FROM customers_rm988837
                WHERE customer_state = 'SP'); -- Todos os pedidos clientes de SP (IN -> Lista)

SELECT * 
    FROM orders_rm988837, customers_rm988837
    WHERE orders_rm988837.customer_id = customers_rm988837.customer_id;
        
SELECT cliente.customer_id, 
        cliente.customer_state,
        pedido.order_status,
        TO_CHAR(pedido.order_purchase_timestamp, 'DD/MM/YYYY') AS data_pedido
    FROM orders_rm988837 pedido, 
        customers_rm988837 cliente,
        order_itens_rm988837 itens
    WHERE pedido.customer_id = cliente.customer_id AND TRIM(pedido.order_status) <> 'delivered'; -- Selecionando colunas de mais de uma tabela, e atribuindo nomes a elas, como variáveis
                
SELECT MIN(data_limite) AS primeira_venda,
    MAX(data_limite) AS ultima_venda,
    SUM(price) AS total_vendas,
    MIN(price) AS venda_minima,
    MAX(price) AS venda_maxima,
    COUNT(*) AS quantidade
        FROM order_itens_rm988837
            GROUP BY data_limite
                ORDER BY data_limite;
                
