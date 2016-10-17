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