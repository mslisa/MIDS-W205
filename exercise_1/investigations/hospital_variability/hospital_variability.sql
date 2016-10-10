SELECT
  measureName
  , round(avg(score), 4) as avg_score
  , round(stddev(score), 4) as var_score
FROM 
  score
GROUP BY measureName
HAVING count(score) > 3
ORDER BY var_score DESC
LIMIT 5
;