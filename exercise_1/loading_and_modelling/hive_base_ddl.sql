DROP TABLE IF EXISTS surveys_temp;
CREATE EXTERNAL TABLE IF NOT EXISTS surveys_temp (
  ProviderNumber string,
  HospitalName string,
  Address string,
  City string,
  State string,
  ZIPCode string,
  CountyName string,
  CommunicationwithNursesAchievementPoints string,
  CommunicationwithNursesImprovementPoints string,
  CommunicationwithNursesDimensionScore string,
  CommunicationwithDoctorsAchievementPoints string,
  CommunicationwithDoctorsImprovementPoints string,
  CommunicationwithDoctorsDimensionScore string,
  ResponsivenessofHospitalStaffAchievementPoints string,
  ResponsivenessofHospitalStaffImprovementPoints string,
  ResponsivenessofHospitalStaffDimensionScore string,
  PainManagementAchievementPoints string,
  PainManagementImprovementPoints string,
  PainManagementDimensionScore string,
  CommunicationaboutMedicinesAchievementPoints string,
  CommunicationaboutMedicinesImprovementPoints string,
  CommunicationaboutMedicinesDimensionScore string,
  CleanlinessandQuietnessofHospitalEnvironmentAchievementPoints string,
  CleanlinessandQuietnessofHospitalEnvironmentImprovementPoints string,
  CleanlinessandQuietnessofHospitalEnvironmentDimensionScore string,
  DischargeInformationAchievementPoints string,
  DischargeInformationImprovementPoints string,
  DischargeInformationDimensionScore string,
  OverallRatingofHospitalAchievementPoints string,
  OverallRatingofHospitalImprovementPoints string,
  OverallRatingofHospitalDimensionScore string,
  HCAHPSBaseScore string,
  HCAHPSConsistencyScore string
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ',',
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys';

DROP TABLE IF EXISTS surveys;
CREATE TABLE surveys
  ROW FORMAT DELIMITED
  STORED AS TEXTFILE
  AS
SELECT
  ProviderNumber providerID
  ,HCAHPSBaseScore baseScore
FROM surveys_temp
SORT BY providerID;




DROP TABLE IF EXISTS complications_temp;
CREATE EXTERNAL TABLE IF NOT EXISTS complications_temp (
  ProviderID string
  ,HospitalName string
  ,Address string
  ,City string
  ,State string
  ,ZIPCode string
  ,CountyName string
  ,PhoneNumber string
  ,MeasureName string
  ,MeasureID string
  ,ComparedtoNational string
  ,Denominator string
  ,Score string
  ,LowerEstimate string
  ,HigherEstimate string
  ,Footnote string
  ,MeasureStartDate string
  ,MeasureEndDate string
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ',',
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/complications';

DROP TABLE IF EXISTS complications;
CREATE TABLE complications
  ROW FORMAT DELIMITED
  STORED AS TEXTFILE
  AS
SELECT
  ProviderID providerID
  ,MeasureID measureID
  ,MeasureName measureName
  ,ComparedtoNational complXnational
FROM complications_temp
SORT BY providerID, measureID;




DROP TABLE IF EXISTS readmissions_temp;
CREATE EXTERNAL TABLE IF NOT EXISTS readmissions_temp (
  ProviderID string
  ,HospitalName string
  ,Address string
  ,City string
  ,State string
  ,ZIPCode string
  ,CountyName string
  ,PhoneNumber string
  ,MeasureName string
  ,MeasureID string
  ,ComparedtoNational string
  ,Denominator string
  ,Score string
  ,LowerEstimate string
  ,HigherEstimate string
  ,Footnote string
  ,MeasureStartDate string
  ,MeasureEndDate string
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ',',
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE IF EXISTS readmissions;
CREATE TABLE readmissions
  ROW FORMAT DELIMITED
  STORED AS TEXTFILE
  AS
SELECT
  ProviderID providerID
  ,MeasureID measureID
  ,MeasureName measureName
  ,ComparedtoNational readmisXnational
FROM readmissions_temp
SORT BY providerID, measureID;




DROP TABLE IF EXISTS hospitals_temp;
CREATE EXTERNAL TABLE IF NOT EXISTS hospitals_temp (
  ProviderID string
  ,HospitalName string
  ,Address string
  ,City string
  ,State string
  ,ZIPCode string
  ,CountyName string
  ,PhoneNumber string
  ,HospitalType string
  ,HospitalOwnership string
  ,EmergencyServices string
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ',',
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE IF EXISTS hospitals;
CREATE TABLE hospitals
  ROW FORMAT DELIMITED
  STORED AS TEXTFILE
  AS
SELECT
  ProviderID providerID
  ,HospitalName hospitalName
  ,Address address
  ,City city
  ,State state
  ,ZIPCode zip
  ,CountyName county
  ,PhoneNumber phone
  ,HospitalType hospitalType
  ,HospitalOwnership hospitalOwner
  ,EmergencyServices emergency
FROM hospitals_temp
SORT BY providerID;




DROP TABLE IF EXISTS effective_temp;
CREATE EXTERNAL TABLE IF NOT EXISTS effective_temp (
  ProviderID string
  ,HospitalName string
  ,Address string
  ,City string
  ,State string
  ,ZIPCode string
  ,CountyName string
  ,PhoneNumber string
  ,Condition string
  ,MeasureID string
  ,MeasureName string
  ,Score string
  ,Sample string
  ,Footnote string
  ,MeasureStartDate string
  ,MeasureEndDate string

  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ',',
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective';

DROP TABLE IF EXISTS effective;
CREATE TABLE effective
  ROW FORMAT DELIMITED
  STORED AS TEXTFILE
  AS
SELECT
  ProviderID providerID
  ,MeasureID measureID
  ,MeasureName measureName
  ,Condition condition
  ,Score effectiveScore
FROM effective_temp
SORT BY providerID, measureID;




DROP TABLE IF EXISTS procedures_temp;
CREATE EXTERNAL TABLE IF NOT EXISTS procedures_temp (
  Provider_ID string
  ,Hospital_Name string
  ,Measure_ID string
  ,Gastrointestinal string
  ,Eye string
  ,NervousSystem string
  ,Musculoskeletal string
  ,Skin string
  ,Genitourinary string
  ,Cardiovascular string
  ,Start_Date string
  ,End_Date string
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ',',
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/procedure';

DROP TABLE IF EXISTS procedures;
CREATE TABLE procedures
  ROW FORMAT DELIMITED
  STORED AS TEXTFILE
  AS
SELECT
  Provider_ID providerID
  ,Gastrointestinal gastrointestinal
  ,Eye eye
  ,NervousSystem nervousSystem
  ,Musculoskeletal musculoskeletal
  ,Skin skin
  ,Genitourinary genitourinary
  ,Cardiovascular cardiovascular
FROM procedures_temp
SORT BY providerID;