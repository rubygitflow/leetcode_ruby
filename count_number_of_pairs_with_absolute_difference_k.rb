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

puts "Count Number of Pairs With Absolute Difference K"
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


#######################
# https://leetcode.com/problems/k-diff-pairs-in-an-array/description/
# 532. K-diff Pairs in an Array
# UNIQUE k-diff pairs !!!

require 'set'

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_pairs(nums, k)
  backside, output = Set.new, Set.new
  nums.each do |num|
    output << num - k if backside === num - k
    output << num if backside === num + k
    backside.add(num)
  end
  output.size
end

puts "K-diff unique Pairs in an Array"
p find_pairs([3,1,4,1,5], 2)
# Output: 2
p find_pairs([1,2,3,4,5], 1)
# Output: 4
p find_pairs([1,3,1,5,4], 0)
# Output: 1
