# https://leetcode.com/problems/count-number-of-special-subsequences/
# 1955. Count Number of Special Subsequences
# Explanation: https://algo.monster/liteproblems/1955

MOD = 10**9 + 7

# @param {Integer[]} nums
# @return {Integer}
def count_special_subsequences(nums)
  nums.reduce([0,0,0]) do |(total_zeros, total_ones, total_twos), n|
    [
      n == 0 ? (1 + 2*total_zeros) % MOD : total_zeros,
      n == 1 ? (total_zeros + 2*total_ones) % MOD : total_ones,
      n == 2 ? (total_ones  + 2*total_twos) % MOD : total_twos
    ]
  end[2]
end

require_relative 'test/cover_test_cases'
test_case "Delete Characters to Make Fancy String (reduce)" do
  p(count_special_subsequences([0,1,2]))
  # Output: 1
  p(count_special_subsequences([0,1,2,0]))
  # Output: 1
  p(count_special_subsequences([0,1,2,2]))
  # Output: 3
  p(count_special_subsequences([2,2,0,0]))
  # Output: 0
  p(count_special_subsequences([0,1,2,0,1,2]))
  # Output: 7
end
