/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

-- using self join: cannot use USING clause, must use ON
/*
SELECT DISTINCT a1.first_name || ' ' || a1.last_name AS "Actor Name"
FROM actor a1
JOIN film_actor fa1 ON (a1.actor_id = fa1.actor_id)
JOIN film_actor fa2 ON (fa1.film_id = fa2.film_id)
JOIN actor a2 ON (fa2.actor_id = a2.actor_id)
WHERE a2.first_name = 'RUSSELL'
  AND a2.last_name = 'BACALL'
-- AND a2.actor_id IN (SELECT actor_id FROM actor WHERE a2.first_name = 'RUSSELL' AND a2.last_name = 'BACALL')
---- change this to be the query of actors with bacall number 1
-- AND a1.actor_id NOT IN (SELECT actor_id FROM actor WHERE a2.first_name = 'RUSSELL' AND a2.last_name = 'BACALL')
  AND NOT (a1.first_name = 'RUSSELL' AND a1.last_name = 'BACALL')
ORDER BY "Actor Name";
*/

SELECT first_name || ' ' || last_name as "Actor Name" --, film_id
FROM actor
JOIN film_actor USING (actor_id)
WHERE film_id IN (
    SELECT film_id
    FROM film_actor
    JOIN actor USING (actor_id)
    WHERE first_name = 'RUSSELL'
      AND last_name = 'BACALL'
)
AND NOT (first_name = 'RUSSELL' AND last_name = 'BACALL')
GROUP BY "Actor Name"
ORDER BY "Actor Name";

/*
FROM film_actor
JOIN actor USING (actor_id)
WHERE first_name = 'RUSSEL'
  AND last_name = 'BACALL';
*/
