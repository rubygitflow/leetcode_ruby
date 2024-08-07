# https://leetcode.com/problems/single-number/
# 136. Single Number

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  nums.reduce(&:^)
end


require_relative 'test/cover_test_cases'
test_case "Single Number" do
  p(single_number([2,2,1,1,1]))
  # Output: 1
  p(single_number([2,2,1]))
  # Output: 1
  p(single_number([4,1,2,1,2]))
  # Output: 4
  p(single_number([1]))
  # Output: 1
end


#######################
# https://leetcode.com/problems/single-number-ii/description/
# 137. Single Number II


# @param {Integer[]} nums
# @return {Integer}
def single_number_ii(nums)
  nums.tally.find {|k, v| v == 1 }&.first || 0
end

test_case "Single Number II" do
  p(single_number_ii([2,2,3,2]))
  # Output: 3
  p(single_number_ii([0,1,0,1,0,1,99]))
  # Output: 99
  p(single_number_ii([0,1,0,1,0,1]))
  # Output: 0
end
