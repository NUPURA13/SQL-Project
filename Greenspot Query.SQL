select *
from greenspot .customer ;

select * from greenspot.sales;

select * from greenspot.stock;

Total purchase cost by product item ;

SELECT product.item_num , product.desc , purchase.cost*qnty AS total_cost 
from product 
inner join purchase 
on product.item_num = purchase.item_numP ;

Total store revenue by product item;

select product.desc , item_num , sales_details. itemNumSales , sales_details.qnty*price AS total_revenue 
from product 
inner join sales_details 
on product.item_num = sales_details.itemNumSales 
group by item_num
order by total_revenue ;

total orders and payments for each customer ;

select cust_name , sum(price*qnty) as Total_payment , count(sd.sales_num) AS Total_order 
from sales_details as sd 
join sales as s on sd.sales_num = s.sales_num
left join customer on customer.cust_id = s.cust_id
group by cust_name
order by Total_payment ;
