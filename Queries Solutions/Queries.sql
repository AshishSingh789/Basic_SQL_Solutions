select * from accounts;


CREATE TABLE Orders (  
    id SERIAL PRIMARY KEY,            -- Auto-incrementing ID  
    account_id INT NOT NULL,          -- Account ID  
    occurred_at TIMESTAMP NOT NULL,   -- Timestamp of the transaction  
    standard_qty INT NOT NULL,        -- Standard quantity  
    gloss_qty INT NOT NULL,           -- Gloss quantity  
    poster_qty INT NOT NULL,          -- Poster quantity  
    total INT NOT NULL,               -- Total  
    standard_amt_usd DECIMAL(10, 2) NOT NULL,  -- Amount in USD for standard  
    gloss_amt_usd DECIMAL(10, 2) NOT NULL,     -- Amount in USD for gloss  
    poster_amt_usd DECIMAL(10, 2) NOT NULL,    -- Amount in USD for poster  
    total_amt_usd DECIMAL(10, 2) NOT NULL       -- Total amount in USD  
);  


CREATE TABLE Regions (  
    id INT PRIMARY KEY,          -- Unique identifier for each region  
    name VARCHAR(255) NOT NULL  -- Name of the region  
);



CREATE TABLE SalesReps (  
    id INT PRIMARY KEY,            -- Unique identifier for each sales representative  
    name VARCHAR(255) NOT NULL,    -- Name of the sales representative  
    region_id INT NOT NULL,        -- Foreign key linking to the Regions table  
    FOREIGN KEY (region_id) REFERENCES Regions(id)  -- Establishing the relationship with the Regions table  
);



CREATE TABLE WebEvents (  
    id SERIAL PRIMARY KEY,          -- Auto-incrementing ID for each transaction  
    account_id INT NOT NULL,        -- Account ID associated with the transaction  
    occurred_at TIMESTAMP NOT NULL, -- Timestamp of when the transaction occurred  
    channel VARCHAR(50) NOT NULL    -- Channel through which the transaction occurred  
);  






Sure! Below are 50 basic SQL questions and 50 intermediate SQL questions, along with hints referring to the SQL operations or concepts needed for each query.

### Basic SQL Questions

1. **Select All Accounts**
   - **Question:** Retrieve all columns from the `Accounts` table.
   
 select * from accounts;
 
- **Hint:** Use the `SELECT` statement.

2. **Count Sales Representatives**

   - **Question:** Count the number of sales representatives in the `SalesReps` table.
   select * from Salesreps;
   select distinct(count(Salesreps.id))
   from Salesreps;
   
   - **Hint:** Use `COUNT()` function.

3. **Account By ID**
   - **Question:** Find the account with id 1001 in the `Accounts` table.
   select * from accounts;
   select *  from accounts where id = 1001;
   - **Hint:** Use `WHERE` clause.

4. **Join Regions and Sales Representatives**
   - **Question:** List all sales representatives along with their region names.
   select * from salesreps;
   select * from regions;
   
   select 
   salesreps.name,
   salesreps.id,
   salesreps.region_id,
   regions.name as region_name
   from salesreps
   inner join regions
   on 
   regions.id = salesreps.region_id 
   group by 
    salesreps.name, 
    salesreps.id, 
    salesreps.region_id, 
    regions.name;

    - **Hint:** Use `INNER JOIN` between `SalesReps` and `Regions`.

5. **Count of Regions**
   - **Question:** How many regions are there in the `Regions` table?
      select * from regions;
	  
 select count(regions.name) as total_regions from regions;

- **Hint:** Use `COUNT()` and no `WHERE`.

6. **List Distinct Accounts**
   - **Question:** Retrieve distinct account IDs from the `Orders` table.
  
  select distinct(account_id) from orders;
   
   
   select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
	
   - **Hint:** Use `DISTINCT` keyword.

7. **Sum of Total Amounts**
   - **Question:** Find the total amount from the `orders` table.
   - **Hint:** Use `SUM()` function.
   select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
	
	select sum(total_amt_usd)  as  total_amount from orders;
   
   
  

8. **Date Filter Transactions**
   - **Question:** List all transactions that occurred on December 24, 2016.
   - **Hint:** Use `WHERE` with date condition.
   
   
   select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
	
	select  * from orders 
	where  Date(occurred_at) ='2016-12-24';

9. **Sales Reps By Region**
   - **Question:** Find all sales representatives who belong to region id 1.
   - **Hint:** Use `WHERE` with `region_id`.
   
   select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
   select * from regions;
   
   select name 
   from regions
   where regions.id = '1';
   
   
   

10. **Transactions in a Channel**
    - **Question:** List all transactions from the `AccountTransactions` table that occurred through the 'direct' channel.
    - **Hint:** Use `WHERE` to filter `channel`.
	  select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
   select * from regions;
   
   select * from webevents
   where webevents.channel = 'direct';
   
   
   

11. **Left Join Accounts and orders**
    - **Question:** Retrieve all accounts and their activities, if they exist.
    - **Hint:** Use `LEFT JOIN` between `Accounts` and `orders`.
	select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
   select * from regions;
   
   select * from accounts
   left join orders
   on 
   accounts.id = orders.account_id;
	
	
12. **Sales Reps by Account ID**
    - **Question:** Get sales representatives for account id 1001.
    - **Hint:** Use `WHERE` to filter `account_id`.
	
	select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
   select * from regions;
   
	
13. **Sort Accounts by Name**
    - **Question:** Sort all accounts in the `Accounts` table by their name in ascending order.
    - **Hint:** Use `ORDER BY`.
	select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
	
	select * from accounts  
	order by name asc;
	
	
	
	
14. **Find Average Amount**
    - **Question:** Calculate the average `total_amt_usd` from the `AccountActivities` table.
	
    - **Hint:** Use `AVG()` function.
     select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
	
	select round(avg(total_amt_usd),2) from orders;
	
15. **Count Transactions by Account ID**
    - **Question:** Count the number of transactions for account id 1001 in `orders`.
	select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
    - **Hint:** Use `COUNT()` with `GROUP BY`.
	
	select count(id) as total_transaction 
	from orders
	where orders.account_id = 1001;

    select * from orders 
    where orders.account_id = 1001;

16. **Region Count**
    - **Question:** What is the count of sales representatives per region?
    - **Hint:** Use `GROUP BY` on `region_id`.
	
	select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
   select * from regions;
   
   select 
   count(salesreps.id),
   --county(salesreps.name),
   regions.name 
   from salesreps
   inner join regions
   on 
   regions.id = salesreps.REGION_id
   GRoup by 
   regions.name ;
   
   
   

17. **Inner Join with Criteria**
    - **Question:** List sales representatives and their corresponding account transactions.
    - **Hint:** Use `INNER JOIN` with a condition.
	
	select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
   select * from regions;
   
	select * from accounts
	left join salesreps
	on  accounts.sales_rep_id = salesreps.id;
	
	
18. **Get Regions with No Sales Reps**
    - **Question:** Retrieve regions that have no sales representatives.
    - **Hint:** Use `LEFT JOIN` and filter for NULL results.
	select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
   select * from regions;
   
   ------Baki hai-------
	


19. **Filter By Date Range**
    - **Question:** Find all transactions between January 1, 2016, and December 31, 2016.
    - **Hint:** Use `BETWEEN` in the `WHERE` clause.
	
	
	select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
   select * from regions;
   
SELECT *
FROM orders
WHERE DATE(occurred_at) BETWEEN '2016-01-01' AND '2016-12-31';


20. **Find Last Transaction Date**
    - **Question:** What is the date of the last transaction in `AccountTransactions`?
    - **Hint:** Use `MAX()` function on `occurred_at`.
	select * from accounts;
	select * from salesreps
	select * from webevents;
	select * from orders;
   select * from regions;
   
   SELECT max(occurred_at) from orders;

	

21. **Distinct Channel Counts**
    - **Question:** How many unique channels are there in the `orders` table?
    - **Hint:** Use `COUNT(DISTINCT channel)`.

    select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
   
select 
count(orders.ID),
--webevents.occured_at,
webevents.channel
from orders
inner join 
webevents
on 
orders.account_id = webevents.account_id
group by webevents.Channel
order by count(orders.ID)  Desc ;

22. **Regions with Multiple Sales Reps**
    - **Question:** List regions having more than one sales representative.
    - **Hint:** Use `HAVING` with `GROUP BY`.
	
	 select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	select regions.id,
	regions.name,
	salesreps.region_id
	from regions 
	inner join salesreps on  regions.id = salesreps.region_id 
	group by 
    salesreps.region_id,
	regions.id,
	regions.name;
	
	
	

23. **Activities by Month**
    - **Question:** Count activities by month for account id 1001.
    - **Hint:** Use `GROUP BY` on `EXTRACT(MONTH FROM occurred_at)`.
	
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	
	select * from accounts 
	where id = '1001';
	
	

24. **Transactions Using Alias**
    - **Question:** Retrieve `account_id` and the total amount as `total` from `Orders`.
    - **Hint:** Use `AS` for aliasing.
	
	select distinct(orders.account_id), sum(orders.total_amt_usd) as total 
	from orders
	group  by orders.account_id
	order by orders.account_id asc ;
	
	
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	

25. **List Transactions and Activities**
    - **Question:** Join `AccountActivities` with `AccountTransactions` to get all transaction details.
    - **Hint:** Use `INNER JOIN`.
	
	
    select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	select 
	accounts.name,
	accounts.website,
	accounts.lat,
	accounts.long,
	accounts.primary_poc,
	accounts.sales_rep_id,
	orders.standard_amt_usd,
	orders.gloss_amt_usd,
	orders.poster_amt_usd,
	orders.total_amt_usd
	from accounts
	inner join orders on orders.account_id = accounts.id;
	 
	
	

26. **Total Amount by Channel**
    - **Question:** Calculate total amounts grouped by channel.
    - **Hint:** Use `GROUP BY` on `channel`.

select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;

select sum(orders.total_amt_usd) as total_amount,
webevents.channel from orders
inner join webevents
on 
orders.account_id = webevents.account_id
group by webevents.channel
order by  sum(orders.total_amt_usd) desc;






	
	

	
28. **Periodical Entry Count**
    - **Question:** How many entries were made in 2015 within `orders`?
    - **Hint:** Use `WHERE` clause with date.
	
	select count(id) as total_entries_made_in_2015
	from orders
	where extract(year from occurred_at) = 2015;
	
	

29. **List Sales Reps Alphabetically**
    - **Question:** List all sales representatives in alphabetical order.
    - **Hint:** Use `ORDER BY` on `name`.
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	select * from salesreps
	order by name asc;
	
30. **Get First 10 Transactions**
    - **Question:** Retrieve the first 10 records from the `orders` table.
    - **Hint:** Use `LIMIT 10`.

select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	select * from orders
	limit 10 ;
	
	----or---------
	
	select total_amt_usd from orders 
	order by total_amt_usd desc
	limit 10;
	

31. **Joining Two Tables with Condition**
    - **Question:** Fetch sales representatives alongside account information.
    - **Hint:** Use `INNER JOIN` with `Accounts`.
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
select accounts.name,
accounts.website,
accounts.lat,
accounts.long,
accounts.primary_poc,
salesreps.id,
salesreps.name as salesreps_name,
salesreps.region_id
from accounts 
inner join salesreps
on 
accounts.sales_rep_id = salesreps.id;

32. **Left Join Region and Sales Reps**
    - **Question:** Retrieve all regions and their corresponding sales representatives, even if none exist.
    - **Hint:** Use `LEFT JOIN`.
select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;

select salesreps.id,
salesreps.name,
salesreps.region_id,
regions.id,
regions.name
from salesreps 
left join regions
on salesreps.region_id =regions.id; 


33. **Right Join Transactions and orders**
    - **Question:** Display all account activities with their related transactions where applicable.
    - **Hint:** Use `RIGHT JOIN`.
select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	select accounts.id,
	accounts.name,
	accounts.website,
	accounts.lat,
	accounts.long,
	accounts.primary_poc,
	accounts.sales_rep_id,
	orders.id,
	orders.occurred_at
	from accounts 
	right join orders 
	on 
	accounts.id = orders.account_id;



  
35. **Count Activities Grouped by Account**
    - **Question:** How many activities does each account have?
    - **Hint:** Use `GROUP BY` with `COUNT()`.
select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	select count(id),
	account_id
	from orders
	group by account_id
	order by count(id) desc;


36. **Sum Transactions by Account ID**
    - **Question:** Total up the `total_amt_usd` for account id 1001 in `AccountActivities`.
    - **Hint:** Use `SUM()` with `WHERE`.
select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;

select sum(total_amt_usd) as Amount,
account_id from orders 
group by account_id; 

------and-------
select sum(total_amt_usd) as Amount
from orders 
where account_id = '1001';




37. **Last Activity Date for an Account**
    - **Question:** Get the most recent activity date for account id 1001.
    - **Hint:** Use `MAX()` on `occurred_at`.
select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	
select max(occurred_at) from orders 
where account_id = '1001';
	
	
38. **Transaction Count by Channel**
    - **Question:** How many transactions occurred through each channel?
    - **Hint:** Use `GROUP BY` on `channel`.
select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;

select count(orders.id),
webevents.channel
from orders 
inner join webevents
on 
webevents.account_id = orders.account_id
group by 
webevents.channel
order by count(orders.id) desc;


39. **Join Sales and Regions for Filtering**
    - **Question:** List sales representatives within the Northeast region only.
    - **Hint:** Use `INNER JOIN` with `WHERE`.
	
	select * from accounts;
	select * from webevents;
	select * from orders;  
    select * from regions;
	select * from salesreps;

select regions.name,
count(distinct(salesreps.id))
from regions
inner join salesreps 
on
salesreps.region_id = regions.id
where regions.name = 'Northeast'
group by regions.name;

	
	

40. **Find Active Accounts**
    - **Question:** Retrieve all accounts that have activity in the past year.
    - **Hint:** Use `WHERE` with date comparison.
	
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	select account_id from orders
	where extract(year  from occurred_at) = '2016';
	
	
	
	

41. **Total Entries per Month**
    - **Question:** Count how many entries exist for each month in `Orders`.
    - **Hint:** Use `GROUP BY` on `EXTRACT(MāONTH FROM occurred_at)`.
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	
    SELECT 
    EXTRACT(MONTH FROM occurred_at) AS month,
    COUNT(id) AS total_entries
    FROM 
    orders
    GROUP BY 
    EXTRACT(MONTH FROM occurred_at)
    ORDER BY 
    month;

	



42. **Last 5 Sales Representatives**
    - **Question:** Get the last 5 sales representatives added.
    - **Hint:** Use `ORDER BY` and `LIMIT 5`.
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;

select id,
name
from salesreps  
order by  id  desc
limit 5;


43. **Joining Tables for Insights**
    - **Question:** Find how many accounts each sales representative services.
    - **Hint:** Use `JOIN` and `GROUP BY`.
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
    SELECT 
    salesreps.id AS sales_rep_id,
    COUNT(accounts.id) AS total_accounts
    FROM 
    accounts
    INNER JOIN 
    salesreps
    ON 
    salesreps.id = accounts.sales_rep_id
    GROUP BY 
    salesreps.id
    ORDER BY 
    total_accounts DESC;





44. **Transaction Statistics by Date**
    - **Question:** Show the number of transactions per day.
    - **Hint:** Use `GROUP BY` on `DATE(occurred_at)`.

select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
45. **Get Null Channels**
    - **Question:** Find transactions that do not have a defined channel.
    - **Hint:** Use `WHERE` to filter for NULL.
	
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;

46. **Join with Conditions**
    - **Question:** Retrieve account activities with their respective transactions directly associated.
    - **Hint:** Use `INNER JOIN` on relevant IDs.
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;

    SELECT 
    accounts.*,  -- Fetch all columns from the accounts table
    orders.*     -- Fetch all columns from the orders table
    FROM 
    accounts
    INNER JOIN 
    orders
    ON 
    accounts.id = orders.account_id;



47. **Region Representations**
    - **Question:** List regions along with the number of sales reps in each.
    - **Hint:** Use `LEFT JOIN` with `COUNT()`.
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	select 
	salesreps.id,
	salesreps.name,
	regions.id,
	regions.name
	from salesreps
	inner join regions 
	on 
	regions.id = salesreps.region_id;
	
	select count(salesreps.id),
	regions.name 
	from salesreps
	left join regions
	on
	regions.id = salesreps.region_id
	group by regions.name
	order by count(salesreps.id)desc ;

	

48. **Finding Top Transaction Amounts**
    - **Question:** Retrieve the top 5 largest transactions by amount.
    - **Hint:** Use `ORDER BY` and `LIMIT`.
	select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
select id , sum(total_amt_usd) as total_amount 
from orders
group by id
order by total_amount desc 
limit 5;



49. **Filter Both Directions**
    - **Question:** Get all sales representatives alongside their transactions, regardless of match.
    - **Hint:** Use `FULL OUTER JOIN`.
select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
	SELECT 
    salesreps.*,  -- Select all columns from the salesreps table
    orders.*      -- Select all columns from the orders table
    FROM 
    salesreps
    FULL OUTER JOIN 
    orders
    ON 
    1 = 1;  -- No actual condition, just to perform a full outer join without any matching criteria

50. **Add a Column for Channel Options**
    - **Question:** Add a column to `orders` indicating if the channel is 'direct' or 'indirect'.
    - **Hint:** Use `CASE` in `SELECT` statement.
	
select * from accounts;
	select * from salesreps;
	select * from webevents;
	select * from orders;  
    select * from regions;
	
ALTER TABLE orders ADD COLUMN channel VARCHAR(255); -- Add the column if it doesn't exist

UPDATE orders
SET channel = webevents.channel
FROM webevents
WHERE orders.account_id = webevents.account_id;

