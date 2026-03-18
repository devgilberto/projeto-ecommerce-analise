-- Análise 2
-- Analisar a quantidade de pedidos + receita gerada por cada MÊS e ANO
-- Objetivo: identificar crescimento ou sazonalidade nas vendas.

SELECT
    substr(o.order_purchase_timestamp,1,7) AS mes,

    COUNT(o.order_id) AS total_pedidos,

    ROUND(SUM(op.payment_value), 2) AS receita_mes

FROM orders o 

JOIN order_payments op 
ON op.order_id = o.order_id

GROUP BY mes

ORDER BY mes;



