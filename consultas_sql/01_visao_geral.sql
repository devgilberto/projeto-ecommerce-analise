
/*
-- Análise 1
-- Visão geral da plataforma
-- Objetivo: entender o volume total de pedidos, clientes e receita
*/
SELECT 
    COUNT(DISTINCT o.order_id) AS total_pedidos,

    ROUND(SUM(op.payment_value), 2) AS receita_total,

    ROUND(SUM(op.payment_value) / COUNT(DISTINCT o.order_id), 2) AS ticket_medio

    FROM orders o 
    JOIN order_payments op 
    ON op.order_id = o.order_id; 

     /* 
     
     INSIGHT:

    O e-commerce gerou R$16M em vendas do total de 99.4 mil pedidos com ticket médio de R$161 por pedido.
     */