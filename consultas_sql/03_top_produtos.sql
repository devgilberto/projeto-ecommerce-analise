

-- Análise 5 - de negócio
-- Produtos com maior participação no faturamento da plataforma
-- Quais categorias mais faturam e qual a participação delas no faturamento total da empresa:

SELECT

    RANK() OVER(
        ORDER BY SUM(oi.price) DESC
    ) AS ranking,

    p.product_category_name,

    ROUND(SUM(oi.price),2) AS faturamento,

    ROUND(
        SUM(oi.price) * 100.0 /
        SUM(SUM(oi.price)) OVER (),
    2) AS percentual_do_total

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

GROUP BY p.product_category_name

ORDER BY ranking

LIMIT 5;



