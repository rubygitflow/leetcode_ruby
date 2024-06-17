# https://leetcode.com/problems/jump-game/description/
# 55. Jump Game

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  out = nums.each_with_index.reduce(0) do |as_far_as_possible, (jump, i)|
    break if as_far_as_possible < i
    [as_far_as_possible, i + jump].max
  end
  !out.nil?
end

puts("Jump Game")
p(can_jump([2,3,1,1,4]))
# Output: true
p(can_jump([3,2,1,0,4]))
# Output: false
