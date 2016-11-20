# import libraries
import sys
import psycopg2

def get_counts(args = 20):
 
    # connect to postgres
    conn = psycopg2.connect(database="Tcount",
                            user="postgres",
                            password="pass",
                            host="localhost",
                            port="5432")

    # create a cursor
    cur = conn.cursor()
 
    # query words and counts
    cur.execute("SELECT word, count FROM tweetwordcount ORDER BY count DESC LIMIT %s", (args,))
    results = cur.fetchall()

    # close the connection
    conn.close

    # return found word counts
    return results

# try to get args from command line otherwise set args to 20
if args:
    args = int(sys.argv[1])
except:
    args = 20
    
# retrieve words from database
results = get_counts(args = args)

# print results
for word, cnt in results:
    print "{:<10} : {}".format(word, cnt)
