# https://leetcode.com/problems/maximum-number-of-balloons/
# 1189. Maximum Number of Balloons

# @param {String} text
# @return {Integer}
def max_number_of_balloons(text)
  chars = { 'b' => 0, 'a' => 0, 'l' => 0, 'o' => 0, 'n' => 0 }
  # store in a hash or char array, either is fine.
  text.each_char { |ch| chars[ch] += 1 if chars.key?(ch) }
  chars['l'] /= 2
  chars['o'] /= 2
  chars.values.min
end

p max_number_of_balloons("nlaebolko")
# Output: 1
p max_number_of_balloons("loonbalxballpoon")
# Output: 2
p max_number_of_balloons("leetcode")
# Output: 0
