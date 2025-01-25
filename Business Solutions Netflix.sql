-- 10 Business Problem from Netflix Data

#1 Count the no. of Movies vs TV Shows Released
SELECT 
	type, 
	COUNT(*) AS content_type 
from netflix 
GROUP BY type;

#2 Find the most common rating for movies and TV shows
SELECT
	type,
    rating
FROM ( 
SELECT
	type,
    rating,
    COUNT(*) AS rating_count,
    RANK() OVER(partition by type ORDER BY COUNT(*) DESC) AS ranking
FROM netflix
GROUP by 1, 2)
AS t1
WHERE ranking = 1;
    
#3 List all movies released in 2020
SELECT 
	show_id,
    type,
    title, 
    country,
    release_year
FROM netflix
WHERE type = "Movie" AND release_year = 2020;

#4 Find the top 5 countries with the most content on nettflix
SELECT	
	country,
    COUNT(show_id) AS 'sid'
FROM netflix
GROUP BY country
ORDER BY sid DESC LIMIT 5;

#5 Identify the Longest movie
SELECT 
	show_id,
    type,
    title,
    duration,
    CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS duration_numeric
FROM netflix
WHERE type = 'Movie'
ORDER BY duration_numeric DESC
LIMIT 1;

#6 Find content that has been added in the last 5 years
SELECT 
	*,
    TO_DATE(date_added, 'Month DD, YYYY')
FROM netflix WHERE
	date_added >= CURRENT_DATE() - INTERVAL '5 years';
    
#7 Find all the movies/tv shows by director 'Rajiv Chilaka'
SELECT
	show_id,
    type,
    title,
    director,
    country,
    rating
FROM netflix
WHERE type = 'Movie' AND director LIKE '%Rajiv Chilaka%';

#8 List all TV shows with more than 5 seasons
SELECT 
    show_id,
    type,
    title,
    duration,
    rating
FROM 
    netflix
WHERE 
    type = 'TV Show' AND 
    CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 5
ORDER BY 
    CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC;
    
#8 Count the number of content items in each Genre
WITH RECURSIVE genre_split AS (
    -- Step 1: Extract the first genre from the 'listed_in' column
    SELECT 
        TRIM(SUBSTRING_INDEX(listed_in, ',', 1)) AS genre,
        show_id,
        TRIM(SUBSTRING(listed_in, LENGTH(SUBSTRING_INDEX(listed_in, ',', 1)) + 2)) AS remaining
    FROM 
        netflix
    WHERE 
        listed_in IS NOT NULL

    UNION ALL

    -- Step 2: Recursively process the remaining string
    SELECT 
        TRIM(SUBSTRING_INDEX(remaining, ',', 1)) AS genre,
        show_id,
        TRIM(SUBSTRING(remaining, LENGTH(SUBSTRING_INDEX(remaining, ',', 1)) + 2)) AS remaining
    FROM 
        genre_split
    WHERE 
        remaining != ''
)
SELECT 
    genre,
    COUNT(show_id) AS total_content
FROM 
    genre_split
GROUP BY 
    genre
ORDER BY 
    total_content DESC;
    
#9 Find each year and avg no. of content released by India on Netflix, return top 5 with highest avg content release!
SELECT 
    YEAR(STR_TO_DATE(countrydate_added, '%M %d, %Y')) AS Year,
    COUNT(*) AS Total,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM netflix WHERE country = 'India') * 100, 2) AS avg_content_per_yr
FROM netflix
WHERE country = 'India'
GROUP BY Year;

#10 List all movies that are Documentaries
SELECT * FROM netflix
WHERE listed_in LIKE '%documentaries%';

