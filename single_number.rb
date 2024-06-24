# https://leetcode.com/problems/single-number/
# 136. Single Number

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  nums.reduce(&:^)
end


puts("Single Number")
p(single_number([2,2,1,1,1]))
# Output: 1
p(single_number([2,2,1]))
# Output: 1
p(single_number([4,1,2,1,2]))
# Output: 4
p(single_number([1]))
# Output: 1
