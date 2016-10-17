DROP TABLE IF EXISTS score;
CREATE TABLE score
  ROW FORMAT DELIMITED
  STORED AS TEXTFILE
  AS

SELECT
  ProviderID as providerID
  ,MeasureID as measureID
  ,MeasureName as measureName
  ,Score as score
FROM complications_temp
WHERE measureID != 'PSI_4_SURG_COMP'
  AND score not in ('Not Available', ' Not Available')

UNION

SELECT
  ProviderID as providerID
  ,MeasureID as measureID
  ,MeasureName as measureName
  ,Score as score
FROM readmissions_temp
WHERE score not in ('Not Available', ' Not Available')
;