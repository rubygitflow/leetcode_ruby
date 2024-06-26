# https://leetcode.com/problems/minimum-time-to-type-word-using-special-typewriter/description/
# 1974. Minimum Time to Type Word Using Special Typewriter

# @param {String} word
# @return {Integer}
def min_time_to_type(word)
  seconds = word.size
  start_ch = 'a'.ord
  word.each_byte do |char|
    distance = (start_ch - char).abs
    seconds += [distance, 26 - distance].min
    start_ch = char
  end
  seconds
end


p(min_time_to_type("abc"))
# Output: 5
p(min_time_to_type("bza"))
# Output: 7
p(min_time_to_type("zjpc"))
# Output: 34
