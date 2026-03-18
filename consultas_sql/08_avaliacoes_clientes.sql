-- Análise 7
-- Avaliação média dos pedidos
-- Objetivo: medir o nível geral de satisfação dos clientes.

SELECT 
    review_score AS score,

    COUNT(*) AS qtd_avaliacoes,

    ROUND(
        COUNT(*) * 100.0 / (SELECT
            COUNT(*)
        FROM order_reviews),
        2
    ) AS porcentagem

FROM order_reviews 

GROUP BY score 

ORDER BY porcentagem DESC;

SELECT 
    ROUND(AVG(review_score), 2) 
    AS avaliacao_media
FROM order_reviews;