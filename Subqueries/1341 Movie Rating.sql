(
    SELECT name AS results
    FROM Users
    JOIN MovieRating ON Users.user_id = MovieRating.user_id
    GROUP BY Users.user_id
    ORDER BY COUNT(MovieRating.rating) DESC, name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT title AS results
    FROM Movies
    JOIN MovieRating ON Movies.movie_id = MovieRating.movie_id
    WHERE DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
    GROUP BY Movies.movie_id
    ORDER BY AVG(MovieRating.rating) DESC, title ASC
    LIMIT 1
);