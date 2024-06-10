# https://leetcode.com/problems/find-triangular-sum-of-an-array/description/
# 2221. Find Triangular Sum of an Array

# @param {Integer[]} nums
# @return {Integer}
def triangular_sum(nums)
  return nums[0] if nums.size == 1

  res = nums.clone # nums.dup
  (res.size-1).times do
    i = 0
    while i < res.size - 1
      res[i] = (res[i] + res[i+1]) % 10
      i += 1
    end
    res.pop
  end
  res.first
end

p triangular_sum([1,2,3,4,5])
# Output: 8
p triangular_sum([5])
# Output: 5
