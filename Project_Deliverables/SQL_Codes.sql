# 1. creating the database and preparing for import
create database credit_card_classification;
use credit_card_classification;

# 3. Setting up for data import
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;


#2. Imported the table using data import wizard, so I didn't have to create the table on my own

#4. Select all the data from table credit_card_data to check if the data was imported correctly.

select * from credit_card_data;

/*/* 5. Use the alter table command to drop the column q4_balance from the database, 
as we would not use it in the analysis with SQL. 
Select all the data from the table to verify if the command worked. 
Limit your returned results to 10. */

alter table credit_card_data 
drop column Q4_balance;

select * from credit_card_data limit 10;

# 6.Use sql query to find how many rows of data you have. 

select count(*) from credit_card_data;

 # 7. Now we will try to find the unique values in some of the categorical columns:
	
    #What are the unique values in the column Offer_accepted?
select distinct(offer_accepted) from credit_card_data;

	#What are the unique values in the column Reward?
select distinct(Reward) from credit_card_data;

	#What are the unique values in the column mailer_type?
select distinct(mailer_type) from credit_card_data;

	#What are the unique values in the column credit_cards_held?
select distinct(credit_cards_held) from credit_card_data;

	#What are the unique values in the column household_size?
select distinct(household_size) from credit_card_data order by household_size ASC;

/*/* 7. Arrange the data in a decreasing order by the average_balance of the house. 
Return only the customer_number of the top 10 customers 
with the highest average_balances in your data. */

select customer_number from credit_card_data order by average_balance DESC limit 10;

# 9. What is the average balance of all the customers in your data? 


select avg(Average_Balance) from credit_card_data;

/* 10. In this exercise we will use simple group by to check the properties 
of some of the categorical variables in our data. 
Note wherever average_balance is asked, 
please take the average of the column average_balance: */

	/* What is the average balance of the customers grouped by Income Level? 
    The returned result should have only two columns, income level and Average balance of the customers. 
    Use an alias to change the name of the second column. */

select avg(average_balance), income_level as Income from credit_card_data group by income_level;

	/*/* What is the average balance of the customers grouped by number_of_bank_accounts_open? 
    The returned result should have only two columns, number_of_bank_accounts_open and Average balance of the customers. 
    Use an alias to change the name of the second column. */


select bank_accounts_open as Open_accounts, round(avg(average_balance), 2) as Average_Balance 
from credit_card_data group by bank_accounts_open; 

	/*/* What is the average number of credit cards held by customers for each of the credit card ratings? 
    The returned result should have only two columns, rating and average number of credit cards held. 
    Use an alias to change the name of the second column. */
  
select Credit_Rating as Rating, avg(Credit_Cards_Held) as Credit_Cards 
from credit_card_data group by credit_rating order by credit_cards DESC;

 /*/* Is there any correlation between the columns credit_cards_held and number_of_bank_accounts_open? 
 You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
 Visually check if there is a positive correlation or negative correlation or no correlation between the variables. */
 
	select credit_cards_held as Credit_Cards, avg(bank_accounts_open) as Banks_Accounts
    from credit_card_data 
    group by credit_cards_held 
    order by credit_cards_held;

/* 11. Your managers are only interested in the customers with the following properties:

Credit rating medium or high
Credit cards held 2 or less
Owns their own home
Household size 3 or more
For the rest of the things, they are not too concerned. Write a simple query to find what are the options 
available for them? Can you filter the customers who accepted the offers here? */

CREATE VIEW Priority_Customers AS
select * from credit_card_data
where credit_rating = 'medium' or credit_rating = 'high' 
and Credit_Cards_Held < 3 
and Own_Your_Home = "Yes" 
and Household_Size > 2;

	 # Can you filter the customers who accepted the offers here?
		select * from Priority_Customers 
        where Offer_accepted = 'Yes';
        
	/*/* 12. Your managers want to find out the list of customers whose average balance is less than the average 
    balance of all the customers in the database. Write a query to show them the list of such customers. 
    You might need to use a subquery for this problem. */
	    
    select * from credit_card_data 
    where average_balance < 
    (select avg(average_balance) 
    from credit_card_data);
	
# 13. Since this is something that the senior management is regularly interested in, create a view of the same query.

	CREATE VIEW Below_Average_Customers AS
    select * from credit_card_data 
    where average_balance < 
    (select avg(average_balance) 
    from credit_card_data);

# 14. What is the number of people who accepted the offer vs number of people who did not?

	select count(customer_number), offer_accepted  
    from credit_card_data 
    group by offer_accepted;
    
/*/* # 15. Your managers are more interested in customers with a credit rating of high or medium. 
What is the difference in average balances of the customers with high credit card rating and low credit card rating? */

	select average_balance - average_balance as difference from credit_card_data 
    where credit_rating in ('High', 'Low')
	group by credit_rating;
    
# 16. In the database, which all types of communication (mailer_type) were used and with how many customers?
	
    select count(*) as Customers , mailer_type as Mail_Type
    from credit_card_data
    group by mailer_type;
    
# 17. Provide the details of the customer that is the 11th least Q1_balance in your database.
	select *, dense_rank() over ( order by Q1_Balance) as boink
    from credit_card_data
    where boink = 12;
    
    

	