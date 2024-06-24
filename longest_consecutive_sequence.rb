# https://leetcode.com/problems/longest-consecutive-sequence/description/
# 128. Longest Consecutive Sequence

require 'set'

# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  srt = nums.to_set
  max_arr = 0
  nums.each do |x|
    if !srt.include?(x - 1)
      length = 1
      while srt.include?(x + length)
        length += 1
      end
      max_arr = [max_arr, length].max
    end
  end
  max_arr
end

p(longest_consecutive([100,4,200,1,3,2]))
# Output: 4
p(longest_consecutive([0,3,7,2,5,8,4,6,0,1]))
# Output: 9
p(longest_consecutive([0,3,17,12,5,8,14,26,0,21]))
# Output: 1
