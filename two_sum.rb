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

#######################
# https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
# 167. Two Sum II - Input Array Is Sorted

# 2 pointer apporach
# Time complexity: O(logn)
# Space complexity: O(1)
def two_sum_sorted(numbers, target)
  n = numbers.length
  left = 0
  right = n - 1
  result = []
  while left < right
    sum = numbers[left] + numbers[right]
    if sum == target
      # + 1 because 1-indexed
      return [left + 1, right + 1]
    elsif sum > target
        right = right - 1
    else
        left = left + 1
    end
  end
  result
end

p two_sum_sorted([2,7,11,15], 9)
# Output: [1,2]
p two_sum_sorted([2,3,4], 6)
# Output: [1,3]
p two_sum_sorted([-1,0], -1)
# Output: [1,2]
p two_sum_sorted([3,3], 5)
# Output: []
p two_sum_sorted([2,7,11,15,15,16,17,18,19,20,21,22,23,24,25], 46)
# Output: [11,15]
