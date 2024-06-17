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


########################
# https://leetcode.com/problems/jump-game-vii/
# 1871. Jump Game VII

# @param {String} s
# @param {Integer} min_jump
# @param {Integer} max_jump
# @return {Boolean}
def can_reach(s, min_jump, max_jump)
  def dfs(i, s, min_jump, max_jump)
    return true if i == s.size - 1

    (min_jump..max_jump).each do |step|
      if s[i + step] == ?0
        return true if dfs(i + step, s, min_jump, max_jump)
      end
    end
    return false
  end
  dfs(0, s, min_jump, max_jump)
end

puts("Jump Game VII")
p(can_reach("011010", 2, 3))
# Output: true
p(can_reach("01101110", 2, 3))
# Output: false
