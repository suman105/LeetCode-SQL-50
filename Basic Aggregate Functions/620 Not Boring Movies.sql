SELECT id, movie, description, rating
FROM cinema
WHERE MOD(id, 2) != 0
and description not like '%boring%'
ORDER BY rating DESC, id ASC;
