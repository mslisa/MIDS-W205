SELECT
  h.hospitalName
  , h.hospitalType
  , round(avg(s.score),4) as avg_score
  , round(sum(s.score),4) as total_score
  , count(s.score) as score_cnt
  , sum(procedure_cnt) as procedure_cnt
FROM
  hospitals as h
LEFT JOIN
  score as s
  ON h.providerID = s.providerID
LEFT JOIN
  procedures p
  ON h.providerID = p.providerID
WHERE procedure_cnt >= 100
GROUP BY h.hospitalName, h.hospitalType
HAVING score_cnt > 3
ORDER BY avg_score ASC
LIMIT 5;