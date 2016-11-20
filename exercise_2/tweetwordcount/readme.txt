#------------------------------------------------------------------------------#
# To run tweetwordcount
#------------------------------------------------------------------------------#
 This process is very easy to run. It will create a Postgres database, run
through a live stream of Tweets, and store the word counts in a table within
the database.
 The process will run for 1 full minute and then terminate. This processing time
was chosed to develop an interesting set of word counts without being too 
lengthy of a run time. If you'd like to change it, update the run.sh.

ASSUMPTION: python, storm and postress have been installed and are running.
 
Step 1) clone this repository (git clone tweetwordcounts)
Step 2) change to the _ directory (cd tweetwordcounts)
Step 3) Run the run shell file (./run.sh)

#------------------------------------------------------------------------------#
# To find information about tweetwordcount (serving scripts)
#------------------------------------------------------------------------------#
 If you'd like to find out information about the collected word counts, run the
finalwordcount.py, histogram.py, or barchart.py files in the scripts directory.

 The finalwordcount.py file will return words collected and their associated 
counts. To look up particular a word(s), type the word(s) after calling 
finalwordcount.py. 

Eg: to find the wordcounts for friend and class:
	root $ python scripts/finalwordcount.py friend class
Eg: to find the wordcounts for all words in the base table:
	root $ python scripts/finalwordcount.py

 The histogram.py will return the words with counts between two values. Enter
the desired values after the call to histogram.py. 

Eg: To find all words with counts between 30 and 160, inclusive:
	root $ python scripts/histogram.py 30 160

 The barchart.py will save a PlotN.png bar chart in the documents directory 
showing the top N words from the parsed tweets. The default number of words is 
N=20. 

Eg: to find the top 20 words:
	root $ python scripts/barchart.py
Eg: to find the top 5 words:
	root $ python scripts/barchart.py 5
#------------------------------------------------------------------------------#