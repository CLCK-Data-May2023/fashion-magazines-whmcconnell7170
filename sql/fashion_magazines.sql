with unpaid_customer_query as
(
With unpaid_query as
(
SELECT * from orders o 
where order_status in('unpaid')
)
SELECT * from unpaid_query
join customers c 
on unpaid_query.customer_id = c.customer_id
)
SELECT customer_name as Customer, printf("$%.2f",(sum(s.price_per_month * s.subscription_length))) as 'Amount Due' from unpaid_customer_query
join subscriptions s 
on unpaid_customer_query.subscription_id = s.subscription_id
where s.description in('Fashion Magazine')
group by Customer
order by Customer;