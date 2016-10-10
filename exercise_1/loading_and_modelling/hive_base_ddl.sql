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
  HCAHPSBaseScore int,
  HCAHPSConsistencyScore int
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ',',
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys';





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
  ,Score int
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
  ,Score int
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




DROP TABLE IF EXISTS procedures_temp;
CREATE EXTERNAL TABLE IF NOT EXISTS procedures_temp (
  Provider_ID string
  ,Hospital_Name string
  ,Measure_ID string
  ,Gastrointestinal int
  ,Eye int
  ,NervousSystem int
  ,Musculoskeletal int
  ,Skin int
  ,Genitourinary int
  ,Cardiovascular int
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
LOCATION '/user/w205/hospital_compare/procedures';





DROP TABLE IF EXISTS stars_temp;
CREATE EXTERNAL TABLE IF NOT EXISTS stars_temp (
  ProviderID string,
  HospitalName string,
  Address string,
  City string,
  State string,
  ZIPCode string,
  CountyName string,
  PhoneNumber string,
  HCAHPSMeasureID string,
  HCAHPSQuestion string,
  HCAHPSAnswerDescription string,
  PatientSurveyStarRating int,
  PatientSurveyStarRatingFootnote string,
  HCAHPSAnswerPercent string,
  HCAHPSAnswerPercentFootnote string,
  NumberofCompletedSurveys string,
  NumberofCompletedSurveysFootnote string,
  SurveyResponseRatePercent string,
  SurveyResponseRatePercentFootnote string,
  MeasureStartDate string,
  MeasureEndDate string
  )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ',',
  "quoteChar" = '"',
  "escapeChar" = '\\'
  )
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/stars';
