# https://leetcode.com/problems/number-of-times-binary-string-is-prefix-aligned/description/
# 1375. Number of Times Binary String Is Prefix-Aligned

# @param {Integer[]} flips
# @return {Integer}
def num_times_all_blue(flips)
  output = right = 0
  0.upto(flips.size - 1) do |left|
    # we store only the right value of the passed range
    right = [right, flips[left]].max
    # True counter for the left-th step
    output += 1 if right == left + 1
  end
  output
end

p num_times_all_blue([3,2,4,1,5])
# Output: 2
p num_times_all_blue([4,1,2,3])
# Output: 1
