SELECT
  hospitalType
  , corr(cast(s.score as int), cast(r.rating as int)) as corr_quality_overall
  , corr(cast(v.var_score as int), cast(r.rating as int)) as corr_var_overall
FROM
  hospitals as h
LEFT JOIN
  score as s
  ON h.providerID = s.providerID
LEFT JOIN
  response as r
  ON h.providerID = r.providerID
LEFT JOIN
  (SELECT
    providerID
    ,stddev(score) as var_score
  FROM score
  GROUP BY providerID) v
  ON h.providerID = v.providerID
LEFT JOIN
  procedures p
  ON h.providerID = p.providerID
WHERE procedure_cnt >= 100
GROUP BY hospitalType
HAVING count(s.score) > 3;