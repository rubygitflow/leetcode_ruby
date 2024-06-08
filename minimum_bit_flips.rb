# https://leetcode.com/problems/minimum-bit-flips-to-convert-number/description/
# 2220. Minimum Bit Flips to Convert Number

# @param {Integer} start
# @param {Integer} goal
# @return {Integer}
def min_bit_flips(start, goal)
  (start ^ goal).to_s(2).split("").map(&:to_i).sum
end

p min_bit_flips(10, 7)
# Output: 3
p min_bit_flips(3, 4)
# Output: 3
p min_bit_flips(10**9, 1)
# Output: 14
