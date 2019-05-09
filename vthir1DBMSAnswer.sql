use Stationary_supply_db;
-- 1. List all items sold by the company, sorted alphabetically by category and the alphabetically by item name
						
                        Select * from customer_products 
                        order by (supplier_categoryID), 
                        product_name ASC;
 -- 2. List the names of all customers who bought pens in quantities of 100 or greater in any order.
						
                         Select concat(fname," ",mName," ",lName) AS Name,
                         quantity 
                         from 
                         Customer_details,Customer_Orders_products,customer_orders 
                         where 
                         (
                         customer_orders.order_id = Customer_Orders_products.order_id 
                         and 
                         product_id = 0 
                         and 
                         Customer_details.Customer_id = customer_orders.customer_id 
                         and 
                         Customer_Orders_products.quantity >= 100
                         );
	-- 3. List the names of all customers who bought both envelopes and labels (either in the same order or different orders).
						
                        Select concat(fname," ",mName," ",lName) AS Name 
						from customer_details t0,customer_orders t1, customer_orders_products a
						JOIN 
						customer_orders_products b 
						on 
						a.order_id = b.order_id
						where (
						(a.product_id = 6 and b.product_id = 8) 
						and 
						(t1.order_id =a.order_id)
						and
						(t1.customer_id = t0.customer_id)
						);

		-- 4. List the names of all customers who bought both envelopes and labels (either in the same order or different orders).

				select concat(fname," ",mName," ",lName) as Name 
                from 
                customer_details t0, customer_orders_products a, 
				customer_orders b
				where (
                (t0.customer_id = b.customer_id) 
                and 
                (a.order_id = b.order_id)
                and 
                a.product_id = 4 
                )
				group by a.order_id
				having 
                Count(a.order_id) = 1
				;
		-- 5. List the names of the customer (or customers) who spent the greatest dollar amount in a single order.
			   SELECT concat(fname," ",mName," ",lName) as Name, 
               SUM(b.product_price * a.quantity) AS Total_Value 
               from 
               customer_details t0,customer_orders_products a,customer_orders t1, product_prices b 
			   where (
               (a.product_id = b.product_id) 
               and 
               (t0.customer_id = t1.customer_id) 
               and 
               (a.order_id = t1.order_id)
               )
			   GROUP BY a.order_id
			   order by 
               SUM(b.product_price * a.quantity) desc;
		-- 6. List each category, the name of the customer who has spent the most on items in that category, and the total amount of money that customer spent in that category.			
					 CREATE VIEW Writing_Supplies AS
								  Select concat(fname," ",mName," ",lName) as Name,a.Supplier_categoryid, SUM(e.product_price * d.quantity) AS Total_Value
									from 
									Customer_products a,customer_details b,customer_orders c,customer_orders_products d,product_prices e
									where
									(
									(d.order_id = c.order_id)
									and
									(c.customer_id = b.customer_id)
									and
									(d.product_id = a.products_id)
									and
									(a.supplier_categoryID = 1)
									and
									(d.product_id = e.product_id)
									)
								Group by d.order_id
								order by Total_Value desc
								LIMIT 1;
     
						CREATE VIEW Paper_Supplies AS
									Select concat(fname," ",mName," ",lName) as Name,a.Supplier_categoryid, SUM(e.product_price * d.quantity) AS Total_Value
										from 
										Customer_products a,customer_details b,customer_orders c,customer_orders_products d,product_prices e
										where
										(
										(d.order_id = c.order_id)
										and
										(c.customer_id = b.customer_id)
										and
										(d.product_id = a.products_id)
										and
										(a.supplier_categoryID = 2)
										and
										(d.product_id = e.product_id)
										)
									Group by d.order_id
									order by Total_Value desc
									LIMIT 1;
								CREATE VIEW basic_supplies AS
									Select concat(fname," ",mName," ",lName) as Name,a.Supplier_categoryid, SUM(e.product_price * d.quantity) AS Total_Value
										from 
										Customer_products a,customer_details b,customer_orders c,customer_orders_products d,product_prices e
										where
										(
										(d.order_id = c.order_id)
										and
										(c.customer_id = b.customer_id)
										and
										(d.product_id = a.products_id)
										and
										(a.supplier_categoryID = 3)
										and
										(d.product_id = e.product_id)
										)
									Group by d.order_id
									order by Total_Value desc
								    LIMIT 1;
																	
								   Select * from Writing_Supplies  
								 UNION ALL
								   Select * from Paper_Supplies         
								 UNION ALL
								 	Select * from basic_supplies
                                    ;
				-- 7. List the names of all customers in the 06460 ZIP code that bought both staplers and paper clips in a single order.
				 Select concat(fname," ",mName," ",lName) AS Name 
				 from customer_details a,
				 customer_addresses b,
				 address c, 
				 customer_orders d,
				 Product_prices f, 
				 Customer_orders_products e
				 join 
				 customer_orders_products e1 
				 on 
                 e.order_id = e1.order_id
				 where 
				 (a.Customer_id =d.customer_id) 
				 and
				 (d.order_id = e.order_id) 
				 and
				 (a.Customer_id = b.Customer_id) 
				 and 
				 (b.Address_id = c.Address_id) 
				 and 
				 c.ZIPCODE = "06460" 
				 and 
				 e1.product_id = 4 
				 and 
				 e.product_id = 9
				 group by 
				 b.Customer_id;
		-- 8. List the name and ZIP code for all customers who have spent more than $500 (this could be spent over several different orders, not just a single order).

				SELECT concat(fname," ",mName," ",lName) as Name,
				zipcode 
				from customer_details t0,
				customer_orders_products a,
				 customer_orders t1,
				 product_prices b,
				 customer_addresses c,
				 address e
				 where 
				 (
				 (t0.customer_id = c.Customer_id) 
				 and
				 (c.Address_id = e.Address_id)
				 and
				 (a.product_id = b.product_id) 
				 and (t0.customer_id = t1.customer_id) 
				 and (a.order_id = t1.order_id))
				 GROUP BY t1.Customer_id
				 Having SUM(b.product_price * a.quantity) > 500;
		
        -- 9. List each state and show the amount of money spent by customers in that state, in descending order (from highest to lowest money spent).
				
                 Select a.state, 
				 SUM(e.product_price * d.quantity) 
				 AS Total_value 
				 from 
				 address a, customer_addresses b, customer_orders c, customer_orders_products d, product_Prices e
				 where
				 ( 
				 (a.Address_id = b.Address_id)
				 and
				 (b.customer_id = c.customer_id)
				 and
				 (c.order_id = d.order_id)
				 and
				 (e.product_id = d.product_id)
				 )
				 group by a.state
				 order by SUM(e.product_price * d.quantity) desc;
			
		-- 10. Show the ZIP code where the largest number of orders were placed (i.e., the highest count of orders placed).			

				 Select a.zipcode from address a,customer_addresses b,customer_orders c,customer_orders_products d,customer_details e
				 where
				 (
				 (e.Customer_id = c.customer_id) 
				 and
				 (a.address_id = b.address_id)
				 and
				 (b.customer_id = c.customer_id)
				 and
				 (c.order_id = d.order_id)
				 )
				 group by d.order_id 
				 order by COUNT(d.order_id) desc
				 LIMIT 1 ;