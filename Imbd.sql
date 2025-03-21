-- 1. Count the total number of records in each table of the database.

select * from movie

SELECT 'movie' AS Movies, COUNT(*) AS total_records FROM movie
SELECT 'director_mapping' AS Dir_mapping, COUNT(*) AS total_records FROM director_mapping
SELECT 'role_mapping' AS Role_mapped, COUNT(*) AS total_records FROM role_mapping
SELECT 'names' AS Identity, COUNT(*) AS total_records FROM names
SELECT 'ratings' As Score, COUNT(*) AS total_records FROM ratings


-- 2. Identify which columns in the movie table contain null values.

select * from movie

SELECT * from movie
Where    
    id IS NULL 
    OR title IS NULL 
    OR year IS NULL 
    OR date_published IS NULL 
    OR duration IS NULL 
    OR country IS NULL 
    OR worlwide_gross_income IS NULL 
    OR languages IS NULL 
    OR production_company IS NULL;

-- 3. Determine the total number of movies released each year, and analyze how the trend changes 
-- month-wise.

select * from movie

select Count(title),year,Extract('Month' from date_published) as month from movie
group by month,year 
order by year,month asc

-- 4. How many movies were produced in either the USA or India in the year 2019?

select * from movie

SELECT COUNT(title) AS total_movies FROM movie
WHERE country IN ('USA', 'India') AND YEAR  = 2019;

-- 5. List the unique genres in the dataset, and count how many movies belong exclusively to one 
-- genre.

select * from genre

select genre,count(movie_id) as Total_no_of_movies from genre
group by genre

SELECT genre,count(movie_id) as Total_no_of_movies
FROM movie
INNER JOIN genre ON movie.id=genre.movie_id 
group by genre

-- 6. Which genre has the highest total number of movies produced?

select * from genre

select genre,count(movie_id) as Max_no_of_movie from genre
group by genre 
order by Max_no_of_movie Desc
limit 1;

-- 7. Calculate the average movie duration for each genre.

select * from genre

SELECT genre, round(AVG(duration),2) AS avg_duration FROM movie
 inner join genre on movie.id=genre.movie_id
GROUP BY genre;

-- 8. Identify actors or actresses who have appeared in more than three movies with an average 
-- rating below 5.

select * from role_mapping
select * from names
select * from ratings

SELECT n.name AS actor_actress_name, COUNT(r.movie_id) AS total_movies, rm.category, Max(r.avg_rating) FROM ratings r
JOIN role_mapping rm ON r.movie_id = rm.movie_id
JOIN names n ON rm.name_id = n.id
WHERE  r.avg_rating<5 and (rm.category='actor' or rm.category ='actress') 
GROUP BY n.name, rm.category
HAVING COUNT(r.movie_id) > 3
ORDER BY  Max(r.avg_rating) desc ;

-- 9. Find the minimum and maximum values for each column in the ratings table, excluding the 
-- movie_id column

select* from ratings

select Max(avg_rating) as Maximum_of_avg_rating,
       Min(avg_rating) as Minimum_of_avg_rating,
       Max(total_votes) as Max_of_Total_votes, 
       Min(total_votes) as Min_of_Total_votes, 
       Max(median_rating) as Max_of_median_rating,
       Min(median_rating) as Min_of_median_rating from ratings

-- 10. Which are the top 10 movies based on their average rating?

select  * from ratings
select * from movie

SELECT title,avg_rating FROM ratings
join movie on movie.id=ratings.movie_id
order by ratings.avg_rating Desc
limit 10

-- 11. Summarize the ratings table by grouping movies based on their median ratings.

select  * from ratings
select * from movie

select movie.title,Round(Avg(median_rating),2) as Median_rating  from ratings 
inner join movie on ratings.movie_id=movie.id 
group by title

-- 12. How many movies, released in March 2017 in the USA within a specific genre, had more 
-- than 1,000 votes?

select * from genre
select * from movie
select * from ratings

SELECT 
    genre.genre AS genre_name,
    COUNT(movie.title) AS total_movies,
	max(movie.year)as Year,
    movie.date_published, 
	Max(ratings.total_votes) as total_votes FROM movie
INNER JOIN genre ON genre.movie_id = movie.id
INNER JOIN ratings ON ratings.movie_id = movie.id
WHERE YEAR = 2017 AND Extract('Month'from date_published) = 3 AND movie.country = 'USA'AND ratings.total_votes > 1000
GROUP BY genre.genre,movie.date_published;

-- 13. Find movies from each genre that begin with the word “The” and have an average rating 
-- greater than 8.

select * from movie
select * from ratings
select * from genre

SELECT movie.title,genre.genre,ratings.avg_rating FROM ratings
INNER JOIN movie ON ratings.movie_id = movie.id
INNER JOIN genre ON genre.movie_id = movie.id
WHERE LOWER(movie.title) LIKE 'the%' AND ratings.avg_rating > 8;

-- 14. Of the movies released between April 1, 2018, and April 1, 2019, how many received a 
-- median rating of 8?

select * from movie
select * from ratings

SELECT movie.title, movie.year,movie.date_published,ratings.median_rating FROM movie
INNER JOIN ratings ON ratings.movie_id = movie.id
WHERE movie.date_published BETWEEN '2018-04-01' AND '2019-04-01' AND ratings.median_rating = 8;

-- 15. Do German movies receive more votes on average than Italian movies?

select * from movie
select * from ratings

SELECT country, ROUND(AVG(ratings.total_votes), 2) AS avg_votes FROM movie
INNER JOIN ratings ON ratings.movie_id = movie.id
WHERE country IN ('Germany', 'Italy')
GROUP BY country
ORDER BY avg_votes DESC
limit 1;

-- 16. Identify the columns in the names table that contain null values.

select * from names

SELECT * FROM names 
WHERE names.id IS NULL 
      OR names.name IS NULL 
      OR names.height IS NULL 
      OR names.date_of_birth IS NULL 
      OR names.known_for_movies iS NULL;
 
-- 17. Who are the top two actors whose movies have a median rating of 8 or higher?

select * from movie
select * from ratings
select * from role_mapping

select name,title,median_rating from role_mapping 
inner join  names on role_mapping.name_id =names.id 
inner join ratings on role_mapping.movie_id=ratings.movie_id 
inner join movie on role_mapping.movie_id=movie.id 
where median_rating >=8 and category='actor'  
order by median_rating desc
limit 2;
 

-- 18. Which are the top three production companies based on the total number of votes their 
-- movies received?

select * from ratings
select * from movie

SELECT 
    movie.production_company,
    COUNT(movie.id) AS total_movies,
    SUM(ratings.total_votes) AS total_votes_received FROM movie
INNER JOIN ratings ON movie.id = ratings.movie_id
WHERE movie.production_company IS NOT NULL
GROUP BY movie.production_company
ORDER BY total_votes_received DESC
LIMIT 3;

-- 19. How many directors have worked on more than three movies?

select * from movie
select * from names
select * from director_mapping

SELECT names.name,COUNT(movie.id) AS Total_movies FROM director_mapping
INNER JOIN names ON names.id = director_mapping.name_id
INNER JOIN movie ON director_mapping.movie_id = movie.id
GROUP BY names.name
HAVING COUNT(movie.id) > 3;
 
-- 20. Calculate the average height of actors and actresses separately

select * from names
select * from role_mapping

SELECT names.name,role_mapping.category ,round(AVG(names.height),2) AS average_height FROM role_mapping
INNER JOIN names ON role_mapping.name_id = names.id
Where names.height is not null
GROUP BY names.name,role_mapping.category
-- Order by category Asc

-- 21. List the 10 oldest movies in the dataset along with their title, country, and director

select * from role_mapping
select * from movie
select * from names

select title ,country,name as director_name ,date_published as date from director_mapping 
inner join names on director_mapping.name_id=names.id 
inner join movie on director_mapping.movie_id=movie.id 
order by date Asc
limit 10;


-- 22. List the top 5 movies with the highest total votes, along with their genres.

select * from genre
select * from ratings
select * from movie

SELECT 
    movie.title,
    genre.genre,
    ratings.total_votes
FROM movie
INNER JOIN ratings ON movie.id = ratings.movie_id
INNER JOIN genre ON movie.id = genre.movie_id
ORDER BY ratings.total_votes DESC  
LIMIT 5;

-- 23. Identify the movie with the longest duration, along with its genre and production company.

select * from genre
select * from movie
order by duration desc

SELECT 
    movie.title,
    genre.genre,
    movie.production_company,
    movie.duration AS duration_minutes FROM movie
INNER JOIN genre ON movie.id = genre.movie_id
ORDER BY movie.duration DESC  
LIMIT 1;

-- 24. Determine the total number of votes for each movie released in 2018.

select * from movie
select * from ratings

Select movie.title,movie.year,ratings.total_votes from movie
inner join ratings on movie.id=ratings.movie_id
where year = '2018'
order by ratings.total_votes DESC;

-- 25. What is the most common language in which movies were produced?

select * from movie

select movie.title,movie.languages,movie.country,count(movie.languages) as count_of_languages from movie
where movie.languages is not null
group by movie.languages,movie.title,movie.country
order by movie.languages desc
limit 1;

SELECT movie.languages,count(movie.languages) as movie_count from movie
GROUP BY movie.languages  
ORDER BY movie_count DESC  
LIMIT 1;  

