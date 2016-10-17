DROP TABLE IF EXISTS response;
CREATE TABLE response
  ROW FORMAT DELIMITED
  STORED AS TEXTFILE
  AS
SELECT
  case when isnull(star.providerID) then survey.providerID else star.providerID end as providerID
  , sum( case when isnull(survey.score) then 0 else survey.score end ) as score
  , sum( case when isnull(star.rating) then 0 else star.rating end ) as rating
FROM
(SELECT
  providerNumber as providerID
  , sum(HCAHPSBaseScore) + sum(HCAHPSConsistencyScore) as score
FROM surveys_temp
WHERE HCAHPSBaseScore != 'Not Available'
  AND HCAHPSConsistencyScore != 'Not Available'
GROUP BY providerNumber) survey

FULL OUTER JOIN

(SELECT
  providerID
  , sum(PatientSurveyStarRating) as rating
FROM stars_temp
WHERE HCAHPSquestion = 'Overall hospital rating - star rating'
  AND PatientSurveyStarRating != 'Not Available'
GROUP BY providerID) star on survey.providerID = star.providerID
GROUP BY star.providerID, survey.providerID
;