/* 
Nesta análise investigamos quais são os métodos de pagamento mais utilizados pelos clientes. Essa informação é importante para entender o comportamento de compra e orientar decisões estratégicas sobre quais meios de pagamento devem ser priorizados pela plataforma.
+ Receita total que cada método de pagamento gera
*/


SELECT
    payment_type,
    COUNT(*) AS total_pagamentos,
    ROUND(
        COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM order_payments), 2
    ) AS porcentagem,

    ROUND(SUM(payment_value),2) AS receita_total

FROM order_payments
GROUP BY payment_type
ORDER BY porcentagem DESC;
