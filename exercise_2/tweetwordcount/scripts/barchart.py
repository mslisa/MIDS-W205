#%matplotlib inline

import matplotlib.pyplot as plt
import numpy as np
import sys
import finalresults

# get top number of results
n = sys.argv[1]

# if no n given, default is 20
if not n:
    n = 20
else:
    n = int(n)

# run the other script and assign to results
#results = finalresults.get_counts()
results = {"a":6, "b": 4, "c":3}

# sort by cnts and take top n
words = sorted(results, key=str.lower)
words, cnt = words[:n], results[words]

# set tick mark locations
y_pos = np.arange(n)

# plot a horizontal bar chart (makes showing words easier)
plt.barh(y_pos, cnt, align = 'center')

# set up things to the graph prettier
plt.ylim([-1, n])
plt.yticks(y_pos, words)
plt.ylabel('Most popular words')
plt.xlabel('Word count')

# save the figure
plt.savefig('documents/Plot{}.png'.format(n), format = 'png')