# https://leetcode.com/problems/concatenation-of-array/description/
# 1929. Concatenation of Array

# @param {Integer[]} nums
# @return {Integer[]}
def get_concatenation(nums)
    nums.concat(nums)
end

p get_concatenation([1,2,1])
# Output: [1,2,1,1,2,1]
p get_concatenation([1,3,2,1])
# Output: [1,3,2,1,1,3,2,1]
