USE henry;

#1 (Retrieve first and last name of each author in the author relation. Order does not matter.)
SELECT lastName, firstName
FROM author;

#2 (Retrieve the title and book type in the book relation. Order does not matter)
SELECT title, TYPE
FROM book;

#3 (Retrieve the publisherCode in the book relation. List each publisherCode only once in the result. Order does not matter. )
SELECT publisherCode
FROM book
GROUP BY publisherCode;

#4 (Retrieve the title and price of each book in the book relation. Further add a calculated column named ‘discount’ that shows the price the book with 25% discount. 
#      Order does not matter. Show the first five rows of the result (LIMIT 5))
SELECT title, price, (price*.75) AS discount
FROM book
LIMIT 5;

#5 (Retrieve the title and price for any book whose price is higher than $20.00 in the book relation. Show the full result)
SELECT title, price
FROM book
WHERE price>20;

#6 (Retrieve the publisherName of all publishers that are in New York only in the publisher relation. Order does not matter)
SELECT publisherName
FROM publisher
WHERE city='New York';

#7 (Retrieve the publisherName of all publishers that are not in New York in the publisher relation. (use != for inequality). Order does not matter. Show the full result)
SELECT publisherName
FROM publisher
WHERE city!='New York';

#8 (Retrieve the bookCode and onHand for each book for which a branch has between 2 and 4 copies in the inventory relation. 
#          Use the BETWEEN keyword in this query.  Order does not matter. Show the full result)
SELECT bookCode, onHand
FROM inventory
WHERE onHand BETWEEN 2 AND 4;

#9 (Retrieve a count of the number of books published by Penguin USA. 
#     Name the column ‘Penguin Books’. Order does not matter. Show your full result)
SELECT COUNT(book.title) AS 'Penguin Books'
FROM book, publisher
WHERE book.publisherCode = publisher.publisherCode AND publisher.publisherName='Penguin USA';

#10 (Retrieve the number of books in the book relation whose prices is $20.00 or lower.
#         Order does not matter. Show your full result. )
SELECT COUNT(bookCode)
FROM book
WHERE price<=20;

# 11  (Retrieve all of the columns from the book and publisher relations in one result.
#    Use aliases in your query and use the simple JOIN syntax (WHERE clause). Order does not matter.)
SELECT *
FROM book
JOIN publisher AS pub
WHERE pub.publisherCode = book.publisherCode;

#12 (Rewrite the previous query using the ON keyword.) 
SELECT *
FROM book
JOIN publisher AS pub
ON pub.publisherCode = book.publisherCode;

#13 (Retrieve the title from the book relation and the city from the publisher relation using a JOIN query.
#              Use aliases in your query. Order the result by title. )
SELECT title, city
FROM book
JOIN publisher AS p
ON p.publisherCode = book.publisherCode
ORDER BY title;

#14	Retrieve the title from the book relation and branchNum and onHand from the inventory relation. 
#      Use aliases in your query.  Order the result by title.  
SELECT title, branchNum, onHand
FROM book
JOIN inventory AS inv
ON book.bookCode = inv.bookCode
ORDER BY title;

#15 (Retrieve the title from the book relation and compute the number of copies of the title that all branches have on hand. 
# Name this computed column ‘Inventory’  
#Hint: You will need to join book and inventory and do an aggregate query. Use aliases in your query. 
# Order the result by the total number of copies of the book in descending order. Show the first two rows of your result.)
SELECT title, SUM(onHand) AS Inventory
FROM inventory AS inv
JOIN book AS b
ON b.bookCode = inv.bookCode
GROUP BY title
ORDER BY Inventory DESC
LIMIT 2;

#16 (Retrieve the first name and last name from the author relation and the title
# from the book relation for all paperback books in the book relation. 
#    Order the result by the author last name and title.)
SELECT firstName, lastName, title
FROM author
JOIN wrote 
ON author.authorNum = wrote.authorNum
JOIN book
ON book.bookCode = wrote.bookCode
WHERE paperback='Y'
ORDER BY lastName, title;

#BONUS Retrieve the title from the book relation and the author lastName from the author relation. Order by author lastName.
# Use aliases in your query. This will involve JOINING the book, author and wrote relations
SELECT lastName AS 'Last Name', title AS 'Title'
FROM author AS a
JOIN wrote AS w 
ON a.authorNum = w.authorNum
JOIN book AS b
ON b.bookCode = w.bookCode
ORDER BY lastName;
