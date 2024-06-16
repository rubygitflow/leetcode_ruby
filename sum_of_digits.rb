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

puts "Sum of Digits of String After Convert"
p get_lucky("iiii", 1)
# Output: 36
p get_lucky("leetcode", 2)
# Output: 6
p get_lucky("zbax", 2)
# Output: 8


########################
# https://leetcode.com/problems/happy-number/description/
# 202. Happy Number

# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  while n>9
    n = n.digits.reduce(0) { _1 + _2 * _2 }
  end
  n == 1
end

puts "Happy Number"
p is_happy(19)
# Output: true
p is_happy(2)
# Output: false
