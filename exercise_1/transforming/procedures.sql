DROP TABLE IF EXISTS procedures;
CREATE TABLE procedures
  ROW FORMAT DELIMITED
  STORED AS TEXTFILE
  AS
SELECT 
  Provider_ID as providerID
  ,sum(Gastrointestinal) + 
  sum(Eye) + 
  sum(NervousSystem) + 
  sum(Musculoskeletal) + 
  sum(Skin) + 
  sum(Genitourinary) + 
  sum(Cardiovascular) as procedure_cnt
FROM procedures_temp 
WHERE Gastrointestinal != 'Not Available'
  AND Eye != 'Not Available'
  AND NervousSystem != 'Not Available'
  AND Musculoskeletal != 'Not Available'
  AND Skin != 'Not Available'
  AND Genitourinary != 'Not Available'
  AND Cardiovascular != 'Not Available'
GROUP BY provider_id;