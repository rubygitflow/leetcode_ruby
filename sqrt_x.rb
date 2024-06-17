# https://leetcode.com/problems/sqrtx/description/
# 69. Sqrt(x)

# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  # binary search
  l, r = 0, x
  while l < r
    middle = (l + r + 1) >> 1
    square = middle * middle
    return middle if square == x

    if square < x
      l = middle
    else
      r = middle - 1
    end
  end
  l
end

p my_sqrt(4)
# Output: 2
p my_sqrt(8)
# Output: 2
p my_sqrt(1)
# Output: 1
p my_sqrt(0)
# Output: 0
p my_sqrt(2**31 - 1)
# Output: 46340
p my_sqrt(2147395601)
# Output: 46340
