# https://leetcode.com/problems/alternating-digit-sum/description/
# 2544. Alternating Digit Sum

# @param {Integer} n
# @return {Integer}
def alternate_digit_sum(n)
  pos = -1
  # n.to_s.chars.reduce(0) {|res,n| pos *= -1; res + n.to_i * pos }
  n.digits.reverse.reduce(0) {|res,n| pos *= -1; res + n * pos }
end

puts "Alternating Digit Sum"
p alternate_digit_sum(521)
# Output: 4
p alternate_digit_sum(111)
# Output: 1
p alternate_digit_sum(886996)
# Output: 0
p alternate_digit_sum(885996)
# Output: -1
p alternate_digit_sum(886995)
# Output: 1


#############################
# https://leetcode.com/problems/add-digits/description/
# 258. Add Digits
# Explanation: https://algo.monster/liteproblems/258

# @param {Integer} num
# @return {Integer}
def add_digits(num)
  return 0 if num.zero?

  (num - 1) % 9 + 1
end

puts "Add Digits (digital root - Time complexity: O(1))"
p add_digits(38)
# Output: 2
p add_digits(0)
# Output: 0
p add_digits(886995)
# Output: 9
p add_digits(1)
# Output: 1
