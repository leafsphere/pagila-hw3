/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT DISTINCT title FROM film_actor a
JOIN film_actor b ON (a.film_id=b.film_id)
JOIN film ON (b.film_id=film.film_id)
WHERE a.actor_id in (
    SELECT actor_id
    FROM film
    JOIN film_actor USING (film_id)
    WHERE title='AMERICAN CIRCUS'
)
AND b.actor_id in (
    SELECT actor_id
    FROM film
    JOIN film_actor USING (film_id)
    WHERE title='AMERICAN CIRCUS'
)
AND a.actor_id != b.actor_id
ORDER BY title;
