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

echo '--> Starting sparse Tweetwordcount'
sparse quickstart Tweetwordcount

echo '--> Moving files to Tweetwordcount'
mv ./src/bolts/* ./Tweetwordcount/src/bolts/
mv ./src/spouts/* ./Tweetwordcount/src/spouts/
mv ./topologies/* ./Tweetwordcount/topologies/
mkdir ./Tweetwordcount/scripts
mv ./scripts/create_TcountDB.py ./Tweetwordcount/scripts

echo '--> changing to Tweetwordcount'
cd Tweetwordcount

echo '--> Initiating Postgress database'
sudo -u w205 initdb -D /home/w205/data

echo '--> Restarting a Postgres database cluster'
sudo -u w205 pg_ctl -D /home/w205/data -l logfile start

echo '--> Creating Tcount database'
sudo -u postgres createdb Tcount

echo 'Creating the tweetwordcount table'
python ./scripts/create_TcountDB.py

echo 'Run sparse'
sparse run -n 'tweetwordcount'
