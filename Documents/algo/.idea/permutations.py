from typing import List
import itertools


class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        res = []
        temp = []

        def backtrack(temp):
            if len(temp) == len(nums):
                res.append(temp[::])
            else:
                for i,n in enumerate(nums):
                    temp.append(i)
                    backtrack(temp)
                    temp = temp[:-1]

        backtrack(temp)
        return res

    def itertool(self, nums):
        res = itertools.permutations(nums)
        return [list(r) for r in res]



def main():
    nums = [1,2,3]
    res = Solution().itertool(nums)
    print(res)
    

if __name__ == "__main__":
    main()