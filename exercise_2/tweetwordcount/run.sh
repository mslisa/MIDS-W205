#!/bin/sh

echo '--> Installing requirements'

echo ' --> Installing pip upgrade'
pip install --upgrade pip
echo ' ----> pip upgrade complete'

echo ' --> Installing psycopg2'
pip install psycopg2
echo ' ----> psycopg2 install complete'

echo ' --> Installing tweepy'
pip install tweepy
echo ' ----> tweepy install complete'

echo '--> Initiating Postgress database'
sudo -u w205 initdb -D /home/w205/data

echo '--> Restarting a Postgres database cluster'
sudo -u w205 pg_ctl -D /home/w205/data start

echo '--> Creating Tcount database'
sudo -u postgres createdb Tcount

echo 'Creating the tweetwordcount table'
python ./scripts/create_TcountDB.py

echo 'Run sparse and stop after 60 seconds'
export LEIN_ROOT=1

sparse run -n 'tweetwordcount' &
sleep 1m 
sparse kill -n 'tweetwordcount'

echo '---Sparse Run Complete---'
echo 'If you'd like to try running something fun, try running:'
echo 'python ./scripts/finalresults.py'
echo 'python ./scripts/histogram.py'
