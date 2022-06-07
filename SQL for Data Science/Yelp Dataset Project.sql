/* Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.

Part 1: Yelp Dataset Profiling and Understanding */

1. Profile the data by finding the total number of records for each of the tables below:

SELECT COUNT(*)
FROM table;
	
i. Attribute table = 10,000
ii. Business table = 10,000
iii. Category table = 10,000
iv. Checkin table = 10,000
v. elite_years table = 10,000
vi. friend table = 10,000
vii. hours table = 10,000
viii. photo table = 10,000
ix. review table = 10,000
x. tip table = 10,000
xi. user table = 10,000
	
2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

SELECT COUNT(DISTINCT(key))
FROM table;

i. Business = id: 10,000
ii. Hours = business_id: 1,562
iii. Category = business_id: 2,643
iv. Attribute = business_id: 1,115
v. Review = id: 10,000; business_id: 8,090; user_id: 9,581
vi. Checkin = business_id: 493
vii. Photo = id: 10,000; business_id: 6,493
viii. Tip = user_id: 537; business_id: 3,979
ix. User = id: 10,000
x. Friend = user_id: 11
xi. Elite_years = user_id: 2,780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	

3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

Answer: no
	
SQL code used to arrive at answer:

SELECT COUNT(*)
FROM user
WHERE id IS NULL OR
    name IS NULL OR
    review_count IS NULL OR
    yelping_since IS NULL OR
    useful IS NULL OR
    funny IS NULL OR
    cool IS NULL OR
    fans IS NULL OR
    average_stars IS NULL OR
    compliment_hot IS NULL OR
    compliment_more IS NULL OR
    compliment_profile IS NULL OR
    compliment_cute IS NULL OR
    compliment_list IS NULL OR
    compliment_plain IS NULL OR
    compliment_cool IS NULL OR 
    compliment_funny IS NULL OR
    compliment_writer IS NULL OR
    compliment_photos IS NULL;

4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

SELECT MIN(column), MAX(column), AVG(column)
FROM table;

	i. Table: Review, Column: Stars
	
		min:	1	max:	5	avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:	1	max:	5	avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:	0	max:	2	avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	53	avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:	0	max:	2,000	avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:

SELECT city, SUM(review_count) AS reviews
FROM business
GROUP BY city
ORDER BY reviews DESC;
	
	Copy and Paste the Result Below:
+-----------------+---------+
| city            | reviews |
+-----------------+---------+
| Las Vegas       |   82854 |
| Phoenix         |   34503 |
| Toronto         |   24113 |
| Scottsdale      |   20614 |
| Charlotte       |   12523 |
| Henderson       |   10871 |
| Tempe           |   10504 |
| Pittsburgh      |    9798 |
| Montréal        |    9448 |
| Chandler        |    8112 |
| Mesa            |    6875 |
| Gilbert         |    6380 |
| Cleveland       |    5593 |
| Madison         |    5265 |
| Glendale        |    4406 |
| Mississauga     |    3814 |
| Edinburgh       |    2792 |
| Peoria          |    2624 |
| North Las Vegas |    2438 |
| Markham         |    2352 |
| Champaign       |    2029 |
| Stuttgart       |    1849 |
| Surprise        |    1520 |
| Lakewood        |    1465 |
| Goodyear        |    1155 |
+-----------------+---------+
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT stars, COUNT(stars) as count
FROM business
WHERE city = 'Avon'
GROUP BY stars;

Copy and Paste the Resulting Table Below (2 columns - star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   1.5 |     1 |
|   2.5 |     2 |
|   3.5 |     3 |
|   4.0 |     2 |
|   4.5 |     1 |
|   5.0 |     1 |
+-------+-------+

ii. Beachwood

SQL code used to arrive at answer:

SELECT stars, COUNT(stars) as count
FROM business
WHERE city = 'Beachwood'
GROUP BY stars;

Copy and Paste the Resulting Table Below (2 columns - star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   2.0 |     1 |
|   2.5 |     1 |
|   3.0 |     2 |
|   3.5 |     2 |
|   4.0 |     1 |
|   4.5 |     2 |
|   5.0 |     5 |
+-------+-------+

7. Find the top 3 users based on their total number of reviews:
		
SQL code used to arrive at answer:

SELECT id, name, review_count
FROM user
ORDER BY review_count DESC
LIMIT 3;

Copy and Paste the Result Below:
+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+		

8. Does posing more reviews correlate with more fans?

SQL code used to arrive at answer:

SELECT id, name, review_count, fans
FROM user
ORDER BY fans DESC;

	Please explain your findings and interpretation of the results:

Posing more reviews does not correlate with more fans. In the table below, there is a mixture of lower and higher numbers of reviews associated with lower values for fans as well as higher values for fans. Therefore, there does not appear to be a relationship between the number of reviews and the number of fans. 

+------------------------+-----------+--------------+------+
| id                     | name      | review_count | fans |
+------------------------+-----------+--------------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |          609 |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |          377 |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 |
| -B-QEUESGWHPE_889WJaeg | Mark      |          861 |  115 |
| -DmqnhW4Omr3YhmnigaqHg | Tiffany   |          408 |  111 |
| -cv9PPT7IHux7XUc9dOpkg | bernice   |          255 |  105 |
| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 |
| -IgKkE8JvYNWeGu8ze4P8Q | Angela    |          694 |  101 |
| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 |
| -4viTt9UC44lWCFJwleMNQ | Ben       |          307 |   96 |
| -3i9bhfvrM3F1wsC9XIB8g | Linda     |          584 |   89 |
| -kLVfaJytOJY2-QdQoCcNQ | Christina |          842 |   85 |
| -ePh4Prox7ZXnEBNGKyUEA | Jessica   |          220 |   84 |
| -4BEUkLvHQntN6qPfKJP2w | Greg      |          408 |   81 |
| -C-l8EHSLXtZZVfUAUhsPA | Nieves    |          178 |   80 |
| -dw8f7FLaUmWR7bfJ_Yf0w | Sui       |          754 |   78 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 |
| -0zEEaDFIjABtPQni0XlHA | Nicole    |          161 |   73 |
+------------------------+-----------+--------------+------+
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: There are more reviews with the word “love” (1780) compared to the word “hate” (232).
	
	SQL code used to arrive at answer:

SELECT COUNT(text)
FROM review
WHERE text LIKE '%love%';
+-------------+
| COUNT(text) |
+-------------+
|        1780 |
+-------------+

SELECT COUNT(text)
FROM review
WHERE text LIKE '%hate%';
+-------------+
| COUNT(text) |
+-------------+
|         232 |
+-------------+

10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:

SELECT id, name, fans
FROM user
ORDER BY fans DESC
LIMIT 10;
		
	Copy and Paste the Result Below:
+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+
	
/* Part 2: Inferences and Analysis */

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

I will analyze the city of Toronto and the category of restaurants. 
	
i. Do the two groups you chose to analyze have a different distribution of hours?
Overall, the 4-5 star group seems to have shorter hours than the 2-3 star group. However, there is one restaurant in both the 2-3 star group (99 Cent Sushi) and the 4-5 star group (Sushi Osaka) who has the same number of hours (12 hours). 

ii. Do the two groups you chose to analyze have a different number of reviews?
The two groups have a different number of reviews. For each group, there is a mixture of small and large numbers of reviews.
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
I am unable to infer anything from the location data for these two groups because the zip codes are different for each restaurant. 

SQL code used for analysis:

SELECT b.name,
       c.category,
       b.city,
       b.postal_code AS zipcode,
       h.hours,
       CASE
            WHEN stars BETWEEN 2 AND 3 THEN '2-3 stars'
            WHEN stars BETWEEN 4 AND 5 THEN '4-5 stars'
       END AS rating,
       b.review_count as reviews
FROM business b
INNER JOIN category c
ON b.id = c.business_id
INNER JOIN hours h
ON b.id = h.business_id
WHERE city = 'Toronto' AND category = 'Restaurants' AND rating IN('2-3 stars', '4-5 stars')
GROUP BY name
ORDER BY stars;
				
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
There are more open businesses (8480) than closed businesses (1520).
         
ii. Difference 2:
The average number of stars for open restaurants (3.679) is higher than the average number of stars for closed restaurants (3.520). The average number of reviews for open restaurants (31.757) are higher than the average number of reviews for closed restaurants (23.198).         
             
SQL code used for analysis:

SELECT COUNT(DISTINCT id) AS Businesses,
       AVG(stars) AS Average_Stars,
       AVG(review_count) AS Average_Reviews,
       is_open
FROM business
GROUP BY is_open;
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
I chose to analyze whether restaurants in Toronto, ON with attributes of ambience, alcohol, or Wi-Fi were associated with having higher star counts. 
         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
I decided to analyze restaurants in Toronto, ON because this city has many restaurants available in our dataset. I used three tables: business, category, and attribute. I used the name, city, state, and stars variables from the business table; the name variable from the attribute table; and the category variable from the category table. In order to join these three tables, I used the primary keys of id for the business table, business_id for the category table, and business_id for the attribute table. I wanted to know if having WiFi, alcohol, and ambience were related to having higher stars for restaurants. Based on my output below, the 4-4.5 star group of restaurants has a mixture of alcohol, Wi-Fi, and ambience while the 2.0 star group of restaurants only has Wi-Fi. This seems to suggest that a combination of attributes of ambience, alcohol, and Wi-Fi can be associated with higher star counts. 
                        
iii. Output of your finished dataset:
+------------------+-----------+---------+-------+-------------+-------+
| name             | attribute | city    | state | category    | stars |
+------------------+-----------+---------+-------+-------------+-------+
| Sushi Osaka      | WiFi      | Toronto | ON    | Restaurants |   4.5 |
| Edulis           | Alcohol   | Toronto | ON    | Restaurants |   4.0 |
| Edulis           | WiFi      | Toronto | ON    | Restaurants |   4.0 |
| Edulis           | Ambience  | Toronto | ON    | Restaurants |   4.0 |
| Big Smoke Burger | Alcohol   | Toronto | ON    | Restaurants |   3.0 |
| Big Smoke Burger | WiFi      | Toronto | ON    | Restaurants |   3.0 |
| Big Smoke Burger | Ambience  | Toronto | ON    | Restaurants |   3.0 |
| Pizzaiolo        | Alcohol   | Toronto | ON    | Restaurants |   3.0 |
| Pizzaiolo        | WiFi      | Toronto | ON    | Restaurants |   3.0 |
| Pizzaiolo        | Ambience  | Toronto | ON    | Restaurants |   3.0 |
| 99 Cent Sushi    | WiFi      | Toronto | ON    | Restaurants |   2.0 |
+------------------+-----------+---------+-------+-------------+-------+

iv. Provide the SQL code you used to create your final dataset:

SELECT b.name,
       a.name AS attribute,
       b.city,
       b.state,
       c.category,
       b.stars
FROM business b
INNER JOIN category c 
ON b.id = c.business_id
INNER JOIN attribute a
ON b.id = a.business_id
WHERE (a.name LIKE 'Ambience' OR 
       a.name LIKE 'Alcohol' OR 
       a.name LIKE 'WiFi') AND
       c.category = 'Restaurants' AND b.city = 'Toronto'
ORDER BY stars DESC;
