from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.

        #connect to DB
        try:
            conn = psycopg2.connect(database="Tcount",
                                    user="postgres",
                                    password="pass",
                                    host="localhost",
                                    port="5432")
        except:
            self.log("Issue with connecting")

        # create a cursor
        cur = conn.cursor()
       
        # get words and counts from tweetwordcount -- will only return one result
        cur.execute("SELECT word, count FROM tweetwordcount WHERE word=%s", (word,))
        records = cur.fetchall()
           
       	# Try to update the db with the new count
       	if records:
       	    cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s", (records[0][1] + 1, word))
	
	# if record doesn't exist (update throws error), add word to table
        else:
            cur.execute("INSERT INTO tweetwordcount (word, count) VALUES (%s, %s)", (word, 1))

	# commit updates to tweetwordcount	
	conn.commit()

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
