-- Análise 4
-- Distribuição de clientes recorrentes e clientes de compra única
-- Objetivo: entender o nível de fidelização dos clientes.
-- Para isso utilizamos customer_unique_id para identificar clientes reais.

WITH contagem AS (
    SELECT 
        c.customer_unique_id,
        COUNT(o.order_id) as total
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
)
SELECT 
    CASE 
        WHEN total = 1 THEN 'compra_unica' 
        ELSE 'cliente_recorrente' 
    END AS tipo_cliente,
    COUNT(*) AS quantidade_clientes
FROM contagem
GROUP BY tipo_cliente;

/* 
Clientes que retornam = 2.997
Clientes únicos = 93.099

Gráfico no Power BI.
*/