# https://leetcode.com/problems/two-sum/description/
# 1. Two Sum

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  num_to_index = {}
  nums.each_with_index do |num, i|
    complement = target - num
    if num_to_index.key?(complement)
      return [num_to_index[complement], i]
    end
    num_to_index[num] = i
  end
  []
end

p two_sum([2,7,11,15], 9)
# Output: [0,1]
p two_sum([3,2,4], 6)
# Output: [1,2]
p two_sum([3,3], 6)
# Output: [0,1]
p two_sum([3,3], 5)
# Output: []
