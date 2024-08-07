## Who is the senior most employee based on job title? 

SELECT 
    first_name, last_name
FROM
    employee
ORDER BY levels DESC
LIMIT 1;

## Which countries have the most Invoices? 

SELECT 
    COUNT(*) AS most_invoice_count, billing_country
FROM
    invoice
GROUP BY billing_country
ORDER BY most_invoice_count DESC;

## What are top 3 values of total invoice? 

SELECT 
    total as total_invoice
FROM
    invoice
ORDER BY total DESC
LIMIT 3;

## Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
## Write a query that returns one city that has the highest sum of invoice totals. 
## Return both the city name & sum of all invoice totals */

SELECT 
    billing_city, SUM(total) AS Invoice_Total
FROM
    invoice
GROUP BY billing_city
ORDER BY Invoice_Total DESC
LIMIT 1;

## Who is the best customer? The customer who has spent the most money will be declared the best customer. 
## Write a query that returns the person who has spent the most money.

SELECT 
    first_name, last_name, SUM(total) AS Total_Spent
FROM
    customer
        JOIN
    invoice ON customer.customer_id = invoice.customer_id
GROUP BY first_name , last_name
ORDER BY Total_Spent DESC
LIMIT 1;

## Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
## Return your list ordered alphabetically by email starting with A. 

SELECT 
    first_name, last_name, email
FROM
    customer
        JOIN
    invoice ON customer.customer_id = invoice.customer_id
        JOIN
    invoice_line ON invoice.invoice_id = invoice_line.invoice_id
        JOIN
    genre ON genre.genre_id = track.genre_id
WHERE
    genre.name LIKE 'ROCK'
ORDER BY first_name , last_name , email;

##  Let's invite the artists who have written the most rock music in our dataset. 
## Write a query that returns the Artist name and total track count of the top 10 rock bands.

SELECT 
    artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM
    track
        JOIN
    album2 ON album2.album_id = track.album_id
        JOIN
    artist ON artist.artist_id = album2.artist_id
        JOIN
    genre ON genre.genre_id = track.genre_id
WHERE
    genre.name LIKE 'Rock'
GROUP BY artist.name
ORDER BY number_of_songs DESC
LIMIT 10;

##  Return all the track names that have a song length longer than the average song length. 
## Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

SELECT 
    name, milliseconds
FROM
    track
WHERE
    milliseconds > (SELECT 
            AVG(milliseconds) AS avg_track_length
        FROM
            track)
ORDER BY milliseconds DESC;






 