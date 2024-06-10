# https://leetcode.com/problems/sum-of-digits-of-string-after-convert/
# 1945. Sum of Digits of String After Convert

# @param {String} s
# @param {Integer} k
# @return {Integer}
def get_lucky(s, k)
  offset = 'a'.ord - 1
  tmp = s.chars.map {|el| el.ord - offset }.join.to_i
  k.times { tmp = tmp.digits.sum }
  tmp
end

p get_lucky("iiii", 1)
# Output: 36
p get_lucky("zbax", 2)
# Output: 8
p get_lucky("leetcode", 2)
# Output: 6
