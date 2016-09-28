# -*- coding: utf-8 -*-
"""
Created on Wed Jun  1 16:41:56 2016

@author: bruno
"""

import numpy as np
import matplotlib.pyplot as plt

# sample size
greyhounds = 500
labs = 500

# randomly generating our sample
grey_height = 28 + 4 * np.random.randn(greyhounds)
lab_height = 24 + 4 * np.random.randn(labs)

#ploting
#plt.hist([grey_height, lab_height], stacked=True, color=['r', 'b'])
#plt.show

#playing around with pylplot lib
#plt.boxplot([grey_height, lab_height])
plt.violinplot([grey_height, lab_height])
plt.show