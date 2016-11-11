from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt



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
        
        # set up the cursor
        cur = conn.cursor()

        #Insert
        statement_entry = "INSERT INTO Tweetwordcount (word,count) \
              VALUES ('" & test', 1)"
        cur.execute("INSERT INTO Tweetwordcount (word,count) \
              VALUES ('test', 1)");
        conn.commit()
        
        #Update
        #Assuming you are passing the tuple (uWord, uCount) as an argument
        cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word=%s", (uWord, uCount))
        conn.commit()
        
        #Select
        cur.execute("SELECT word, count from Tweetwordcount")
        records = cur.fetchall()
        for rec in records:
           print "word = ", rec[0]
           print "count = ", rec[1], "\n"
        conn.commit()
        
        conn.close()


        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))