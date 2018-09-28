1.  select *
    from survey
    limit 10;

2.  SELECT question as 'Questions',
     COUNT(DISTINCT user_id) as 'Number of Responses'
    FROM survey
    GROUP BY question;

4. select *
   from quiz
   limit 5;

   select *
   from home_try_on
   limit 5;

   select *
   from purchase
   limit 5;

5. SELECT DISTINCT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
   FROM quiz q
   LEFT JOIN home_try_on h
    ON q.user_id = h.user_id
    LEFT JOIN purchase p
    ON p.user_id = q.user_id
   LIMIT 10;

6. select style, count(user_id)
   from quiz
   group by style 
   limit 10;

- select count(user_id) as 'People Who Took Quiz'
   from quiz;

   select count(user_id) as 'People Who Tried On at Home'
   from home_try_on;

   select count(user_id) as 'People Who Made Purchase'
   from purchase;

- WITH funnels AS (
  SELECT DISTINCT q.user_id,
     h.user_id IS NOT NULL AS 'Try_at_home',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM quiz AS 'q'
  LEFT JOIN home_try_on AS 'h'
    ON h.user_id = q.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = h.user_id)
  SELECT count(*) as 'Quiz Takers', sum(Try_at_home) as 'Tried at Home', sum(is_purchase) 'Purchases', 
  1.0 * sum(Try_at_home) / count(user_id) as 'Percent Who Tried at Home',
  1.0 * sum(is_purchase) / sum(Try_at_home) as 'Percent of Home Who Purchased'
  from funnels;

- select count(home_try_on.user_id) as 'Try at Home', home_try_on.number_of_pairs 'Number of Pairs', count(purchase.user_id) 'Purchases'
  from home_try_on
  left join purchase
  on home_try_on.user_id = purchase.user_id
  group by number_of_pairs;

