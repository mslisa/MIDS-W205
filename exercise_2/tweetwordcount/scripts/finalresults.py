# import libraries
import sys
import psycopg2
 
# get words from command line
args = sys.argv[1:]
 
# connect to postgres
conn = psycopg2.connect(database="Tcount",
                        user="postgres",
                        password="pass",
                        host="localhost",
                        port="5432")

# create a cursor
cur = con.cursor()
 
# query words and counts
cur.execute("SELECT word, count FROM tweetwordcount")
results = {rec[0]: rec[1] for rec in cur.fetchall()}

# If no words given, return all words and counts, sorted alphabetically
if args:
    
    # print words and counts, one per line
    for word in args:
        print "Total number of occurences of {}: {})".format(word, results[word])
        
# otherwise, return total number of word occurances for specific words 
else:

    # print words and counts, one per line
    for word in sorted(results, key=str.lower):
        print "Word:{:<12} Count:{:<4}".format(word, results[word])

# close the connection
conn.close()
