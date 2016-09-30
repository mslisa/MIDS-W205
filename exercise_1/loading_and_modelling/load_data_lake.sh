chmod 400 "/c/Users/lisam/Documents/CodingPrograms/AWS/MIDSW205.pem"
ssh -i 
"/c/Users/lisam/Documents/CodingPrograms/AWS/MIDSW205.pem" 
root@ec2-54-85-56-236.compute-1.amazonaws.com

fdisk -l
mount -t ext4 /dev/xvdf /data
/root/start-hadoop.sh
/data/start_postgres.sh
su - w205

hdfs dfs -mkdir /user/w205/hospital_compare

mkdir hospital_data
cd hospital_data
wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
unzip Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s\?content_type\=application%2Fzip\;\ charset\=binary

hdfs dfs -mkdir /user/w205/hospital_compare/surveys
tail -n +2 'hvbp_hcahps_05_28_2015.csv' > 'surveys.csv'
hdfs dfs -put surveys.csv /user/w205/hospital_compare/surveys

hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
tail -n +2 'Hospital General Information.csv' > 'hospitals.csv'
hdfs dfs -put surveys.csv /user/w205/hospital_compare/hospitals

hdfs dfs -mkdir /user/w205/hospital_compare/effective
tail -n +2 'Timely and Effective Care - Hospital.csv' > 'effective.csv'
hdfs dfs -put surveys.csv /user/w205/hospital_compare/effective

hdfs dfs -mkdir /user/w205/hospital_compare/complications
tail -n +2 'Complications - Hospital.csv' > 'complications.csv'
hdfs dfs -put surveys.csv /user/w205/hospital_compare/complications

hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
tail -n +2 'Readmissions and Deaths - Hospital.csv' > 'readmissions.csv'
hdfs dfs -put surveys.csv /user/w205/hospital_compare/readmissions

hdfs dfs -mkdir /user/w205/hospital_compare/procedures
tail -n +2 'Outpatient Procedures - Volume.csv' > 'procedures.csv'
hdfs dfs -put surveys.csv /user/w205/hospital_compare/procedures