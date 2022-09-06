--Create a clothing store database

CREATE TABLE store (id INTEGER PRIMARY KEY, name TEXT, color TEXT, price INTEGER, quantity INTEGER);

INSERT INTO store VALUES (1, "shirts", "blue", 5, 2);
INSERT INTO store VALUES (2, "pants", "orange", 10, 5);
INSERT INTO store VALUES (3, "shoes", "black", 5, 6);
INSERT INTO store VALUES (4, "hats", "yellow", 7, 10);
INSERT INTO store VALUES (5, "blouses", "pink", 8, 15);

--Display the database ordered by price
SELECT * FROM store ORDER BY price;

--Display the total quantity of clothing items
SELECT SUM(quantity) FROM store;
