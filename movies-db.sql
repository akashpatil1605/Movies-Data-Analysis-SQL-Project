SELECT * FROM moviesdb.movies;
SELECT * FROM moviesdb.movies limit 5;
SELECT * FROM moviesdb.financials;
###String Operations
SELECT movie_id,language_id FROM moviesdb.movies;
SELECT distinct studio FROM moviesdb.movies;
SELECT COUNT(distinct studio) FROM moviesdb.movies;
SELECT * FROM moviesdb.movies where industry="hollywood";
SELECT count(*) FROM moviesdb.movies where industry="hollywood";
SELECT * FROM moviesdb.movies where industry!="hollywood";
SELECT * FROM moviesdb.movies where title like "%thor%";    # Use wildcard search
SELECT * FROM moviesdb.movies where studio in("Hombale Films","Marvel Studios");

###Numerical Functions 
SELECT * FROM moviesdb.movies where imdb_rating between 7 and 9;
SELECT * FROM moviesdb.movies where release_year in (2017,2010,2022);
SELECT * FROM moviesdb.movies where studio=" ";
SELECT * FROM moviesdb.movies where imdb_rating=" " ;
SELECT * FROM moviesdb.movies where imdb_rating is null;

####Operations
SELECT max(imdb_rating) FROM moviesdb.movies where industry="hollywood";
SELECT min(imdb_rating) FROM moviesdb.movies where industry="hollywood";
SELECT avg(imdb_rating) FROM moviesdb.movies where industry="hollywood";
SELECT distinct industry FROM moviesdb.movies;
SELECT industry FROM moviesdb.movies group by industry;
SELECT industry,count(*) FROM moviesdb.movies group by industry;
SELECT industry,count(*) as industry_count FROM moviesdb.movies group by industry;
SELECT industry,count(*) as industry_count FROM moviesdb.movies group by industry having industry_count>=20;
SELECT * FROM moviesdb.financials;       
SELECT *, revenue-budget AS profit FROM moviesdb.financials;
SELECT *,if (currency="USD",revenue*77,revenue) as revenue_inr FROM moviesdb.financials;


SELECT *,
case 
when unit='Billions' then revenue*1000
when unit='Thousands' then revenue/1000
when unit='Millions' then revenue
end as rev_all from moviesdb.financials;

### compelte files joining 
SELECT moviesdb.movies.movie_id,title,revenue
FROM moviesdb.movies
INNER JOIN moviesdb.financials
ON moviesdb.movies.movie_id=moviesdb.financials.movie_id;

SELECT moviesdb.movies.*,moviesdb.financials.*
FROM moviesdb.movies
INNER JOIN moviesdb.financials
ON moviesdb.movies.movie_id=moviesdb.financials.movie_id;

##### Use of Sum , Where ,and
SELECT moviesdb.movies.movie_id,moviesdb.movies.title,moviesdb.financials.revenue
FROM moviesdb.movies
JOIN moviesdb.financials
ON moviesdb.movies.movie_id=moviesdb.financials.movie_id where industry="Bollywood";

SELECT moviesdb.movies.movie_id,moviesdb.movies.title,moviesdb.financials.revenue
FROM moviesdb.movies
right JOIN moviesdb.financials
ON moviesdb.movies.movie_id=moviesdb.financials.movie_id where industry="Bollywood";

SELECT moviesdb.movies.movie_id,moviesdb.movies.title,moviesdb.financials.revenue
FROM moviesdb.movies
left JOIN moviesdb.financials
ON moviesdb.movies.movie_id=moviesdb.financials.movie_id where industry="Bollywood";

SELECT moviesdb.movies.movie_id,moviesdb.movies.title,moviesdb.financials.revenue
FROM moviesdb.movies
left JOIN moviesdb.financials
ON moviesdb.movies.movie_id=moviesdb.financials.movie_id where industry="Bollywood"
union
SELECT moviesdb.movies.movie_id,moviesdb.movies.title,moviesdb.financials.revenue
FROM moviesdb.movies
right JOIN moviesdb.financials
ON moviesdb.movies.movie_id=moviesdb.financials.movie_id where industry="Bollywood";

