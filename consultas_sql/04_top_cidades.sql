-- Análise 6
-- Receita gerada por vendedor
-- Objetivo: identificar vendedores estratégicos com maior impacto no faturamento.

SELECT 

    RANK() OVER(
        ORDER BY ROUND(SUM(o.price), 2) DESC
    ) AS ranking,

    s.seller_city,
    ROUND(SUM(o.price), 2) AS receita_total

FROM order_items o

JOIN sellers s 
ON s.seller_id = o.seller_id

GROUP BY s.seller_city

ORDER BY receita_total DESC

LIMIT 5;

