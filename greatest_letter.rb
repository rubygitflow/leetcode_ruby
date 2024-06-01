# https://leetcode.com/problems/greatest-english-letter-in-upper-and-lower-case/description/
# 2309. Greatest English Letter in Upper and Lower Case

require 'set'

# @param {String} s
# @return {String}
def greatest_letter(s)
  ans=""
  s.chars.each_with_object([Hash.new(0), Set[]]) do |c, (col, mem)|
    # skip the same case !!!
    unless mem === c
      mem.add(c)
      upper = c.upcase
      # we have caught a changed character case if the character already exists
      col[upper] += 1
      # processing an additional condition
      ans = col[upper] == 2 ? [upper, ans].max : ans
    end
    [col, mem]
  end
  ans
end

p greatest_letter("l Ee TcOd E ")
# Output: "E"
p greatest_letter("a rR AzFif")
# Output: "R"
p greatest_letter("a rr AzFifA")
# Output: "F"
p greatest_letter("AbCdEfGhIjK")
# Output: ""
p greatest_letter("a рр AzФiфA")
# Output: "Ф"
