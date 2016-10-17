echo 'Making hadoop folder'
hdfs dfs -mkdir /user/w205/hospital_compare

echo 'Making local folder'
mkdir hospital_data
cd hospital_data

echo 'Downloading file'
wget -O hospitaldata.zip "https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"

echo 'Unzipping data'
unzip hospitaldata.zip

echo 'Prepping surveys data'
hdfs dfs -mkdir /user/w205/hospital_compare/surveys
tail -n +2 'hvbp_hcahps_05_28_2015.csv' > 'surveys.csv'
hdfs dfs -put -f surveys.csv /user/w205/hospital_compare/surveys

echo 'Prepping hospitals data'
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
tail -n +2 'Hospital General Information.csv' > 'hospitals.csv'
hdfs dfs -put -f hospitals.csv /user/w205/hospital_compare/hospitals

echo 'Prepping complications data'
hdfs dfs -mkdir /user/w205/hospital_compare/complications
tail -n +2 'Complications - Hospital.csv' > 'complications.csv'
hdfs dfs -put -f complications.csv /user/w205/hospital_compare/complications

echo 'Prepping readmissions data'
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
tail -n +2 'Readmissions and Deaths - Hospital.csv' > 'readmissions.csv'
hdfs dfs -put -f readmissions.csv /user/w205/hospital_compare/readmissions

echo 'Prepping procedures data'
hdfs dfs -mkdir /user/w205/hospital_compare/procedures
tail -n +2 'Outpatient Procedures - Volume.csv' > 'procedures.csv'
hdfs dfs -put -f procedures.csv /user/w205/hospital_compare/procedures

echo 'Prepping stars data'
hdfs dfs -mkdir /user/w205/hospital_compare/stars
tail -n +2 'HCAHPS - Hospital.csv' > 'stars.csv'
hdfs dfs -put -f stars.csv /user/w205/hospital_compare/stars
