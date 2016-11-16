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
        
        # If the table doesn't exists
        # http://stackoverflow.com/questions/1874113/checking-if-a-postgresql-table-exists-under-python-and-probably-psycopg2

        # get words and counts from tweetwordcount -- will only return one result
        cur.execute("SELECT word, count FROM tweetwordcount WHERE word=%s", (word,))
        records = cur.fetchall()
	
	self.log("1. Starting with word %s" % (word) )
           
       	# Try to update the db with the new count
       	if records:
	    self.log("2. Found Record of %s with count %d" % (records[0][0], records[0][1]) )
       	    cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s", (records[0][1] + 1, word))
	
	# if record doesn't exist (update throws error), add word to table
        else:
	    self.log("3. Did not find Record of %s" % (word))
            cur.execute("INSERT INTO tweetwordcount (word, count) VALUES (%s, %s)", (word, 1))
		
	conn.commit()

	cur.execute("SELECT word, count FROM tweetwordcount")
	records = cur.fetchall()

	self.log("4. Testing out the database was updated")
	for rec in records:
		self.log('5. Database now has Word: %s = %d' % (rec[0], rec[1]) )        

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        #self.log('%s: %d' % (word, self.counts[word]))
