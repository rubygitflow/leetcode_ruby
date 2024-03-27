# https://leetcode.com/problems/running-sum-of-1d-array/description/
# 1480. Running Sum of 1d Array

# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
  sum = 0
  nums.map { |v| sum += v }
end

p running_sum([1,2,3,4])
# Output: [1,3,6,10]
p running_sum([1,1,1,1,1])
# Output: [1,2,3,4,5]
p running_sum([3,1,2,10,1])
# Output: [3,4,6,16,17]
