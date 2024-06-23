# https://leetcode.com/problems/smallest-even-multiple/description/
# 2413. Smallest Even Multiple

# Given a positive integer n, return the smallest positive integer that is a multiple of both 2 and n.

# @param {Integer} n
# @return {Integer}
def smallest_even_multiple(n)
  n.even? ? n : n * 2
end

p smallest_even_multiple(5)
# Output: 10
p smallest_even_multiple(6)
# Output: 6
