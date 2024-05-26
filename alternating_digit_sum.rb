# https://leetcode.com/problems/alternating-digit-sum/description/
# 2544. Alternating Digit Sum

# @param {Integer} n
# @return {Integer}
def alternate_digit_sum(n)
  pos = -1
  # n.to_s.chars.reduce(0) {|res,n| pos *= -1; res + n.to_i * pos }
  n.digits.reverse.reduce(0) {|res,n| pos *= -1; res + n * pos }
end

p alternate_digit_sum(521)
# Output: 4
p alternate_digit_sum(111)
# Output: 1
p alternate_digit_sum(886996)
# Output: 0
