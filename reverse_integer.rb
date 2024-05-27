# https://leetcode.com/problems/reverse-integer/description/
# 7. Reverse Integer

# @param {Integer} x
# @return {Integer}
def reverse(x)
  output = 0
  mi, mx = -(2**31), 2**31 - 1
  while x != 0
      return 0 if output < mi / 10 + 1 || output > mx / 10
      
      y = x % 10
      y -= 10 if x < 0 && y > 0
      output = output * 10 + y
      x = (x - y) / 10
  end
  return output
end

p reverse(1647380)
# Output: 837461
p reverse(123)
# Output: 321
p reverse(-123)
# Output: -321
p reverse(-120)
# Output: -21
