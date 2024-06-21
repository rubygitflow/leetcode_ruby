# https://leetcode.com/problems/palindrome-number/description/
# 9. Palindrome Number

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0 || (x != 0 && x % 10 == 0)
    
  y = 0
  while y < x
    y = y * 10 + x % 10
    x /= 10
  end
  return [y, y / 10].include?(x)
end

p(is_palindrome(-121))
# Output: false
p(is_palindrome(121))
# Output: true
p(is_palindrome(123435))
# Output: false
p(is_palindrome(73537))
# Output: true
p(is_palindrome(900))
# Output: false
p(is_palindrome(-123435))
# Output: false
p(is_palindrome(994499))
# Output: true
