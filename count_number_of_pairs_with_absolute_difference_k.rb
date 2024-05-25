# https://leetcode.com/problems/count-number-of-pairs-with-absolute-difference-k/description/
# 2006. Count Number of Pairs With Absolute Difference K

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def count_k_difference(nums, k)
  hash = Hash.new(0)
  output = 0
  nums.each do |num|
    # Always compare with what is to the left of the current number 
    output += hash.fetch(num - k, 0) + hash.fetch(num + k, 0)
    hash[num] += 1
  end
  output
end

p count_k_difference([1,2,2,1], 1)
# Output: 4
p count_k_difference([1,2,2,1,1], 1)
# Output: 6
p count_k_difference([1,2,2,1,1,2], 1)
# Output: 9
p count_k_difference([1,3], 3)
# Output: 0
p count_k_difference([3,2,1,5,4], 2)
# Output: 3