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
# Explanation of the expected solution based on the "Two Pointers" technique:
# https://algo.monster/liteproblems/202

# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  return false if n.zero?
  # puts n
  # while n>9  # 7 < 9, but it is the happy number
  # while n != 1 && n != 4
  while ![1,4].include?(n) # Statistics are a stubborn thing
    n = n.digits.reduce(0) { _1 + _2 * _2 }
    # puts n
  end
  n == 1
end

puts "Happy Number"
p is_happy(0)
# Output: false
p is_happy(2)
# Output: false
p is_happy(2**31 - 1) # 2147483647
# Output: false
p is_happy(4722354576)
# Output: false
p is_happy(9999975)
# Output: false

p is_happy(7)
# Output: true
p is_happy(19)
# Output: true
p is_happy(99924)
# Output: true
p is_happy(85226)
# Output: true
p is_happy(72781)
# Output: true
p is_happy(57052)
# Output: true
p is_happy(7414)
# Output: true
p is_happy(9999976)
# Output: true

def discovering_happy_numbers
  puts "Happy Numbers list"
  out = []
  # for i in (1..(2**31 - 1))
  # for i in (1..10_000_000)
  for i in (9_990_000..10_000_000)
    out << i if is_happy(i)
  end
  out
end

# p discovering_happy_numbers

def count_happy_numbers
  puts "Quantity of Happy Numbers"
  # 1_418_854/10_000_000
  out = 0
  # for i in (1..(2**31 - 1))
  for i in (1..10_000_000)
    out += 1 if is_happy(i)
  end
  out
end

# p count_happy_numbers
