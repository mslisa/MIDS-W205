#%matplotlib inline

import matplotlib.pyplot as plt
import numpy as np

# run `python ./scripts/top20.py 20` and copy out top 20 results
# paste the results into excel and convert data to columns on spaces and :
# then use a formula of ="("""& XX &""", "& YY &")," where XX is the word and YY is the count
# past the list into the results list definition below and delete last comma
# then continue

results = [("the", 55),
            ("I", 43),
            ("to", 40),
            ("you", 37),
            ("a", 35),
            ("for", 30),
            ("this", 29),
            ("in", 26),
            ("and", 20),
            ("is", 19),
            ("with", 17),
            ("it", 16),
            ("me", 15),
            ("of", 15),
            ("The", 14),
            ("at", 13),
            ("New", 13),
            ("just", 13),
            ("my", 13),
            ("like", 12)
            ]
n, words, cnt = len(results), [x[0] for x in results], [x[1] for x in results]

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
#plt.savefig('documents/Plot{}.png'.format(n), format = 'png')
