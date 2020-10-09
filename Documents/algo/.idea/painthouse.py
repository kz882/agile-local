# leetcode 256 painthouse 2020/10/07
import sys
print(sys.version)
print(sys.executable)

import numpy as np


def minCost(costs):
    # info[i][j]: the min cost up to house i, if painted color j
    n = len(costs)
    info = np.zeros((n,3))
    info[0] = costs[0]

    # update info based on costs
    for i in range(1,n):
        # invariant: info[i][j] = min(info[i-1][not j #1], info[i-1][not j #2]) + costs[i][j]
        info[i][0] = min(info[i-1][1], info[i-1][2]) + costs[i][0]
        info[i][1] = min(info[i-1][0], info[i-1][2]) + costs[i][1]
        info[i][2] = min(info[i-1][0], info[i-1][1]) + costs[i][2]

    return min(info[n-1][0], info[n-1][1], info[n-1][2])

costs = [[17,2,17],[16,16,5],[14,3,19]]
print(minCost(costs))