-- Análise 8
-- Receita por estado
-- Objetivo: identificar regiões com maior concentração de vendas.

SELECT 
    c.customer_state,

    ROUND(
        SUM(p.payment_value),2
    ) AS receita_total,

    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM order_payments), 2
    ) AS porcentagem

FROM orders o

JOIN customers c
ON o.customer_id = c.customer_id

JOIN order_payments p
ON o.order_id = p.order_id

GROUP BY c.customer_state
ORDER BY receita_total DESC

LIMIT 5;