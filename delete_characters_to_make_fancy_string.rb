# https://leetcode.com/problems/delete-characters-to-make-fancy-string/description/
# 1957. Delete Characters to Make Fancy String

# @param {String} s
# @return {String}
def make_fancy_string(s)
  s.chars.reduce(['', '', '']) do |(acc, prev_ch, prev2_ch), ch|
    [
      ch == prev_ch && ch == prev2_ch ? acc : acc + ch,
      ch,
      prev_ch
    ]
  end.first
end

p(make_fancy_string("leeetcode"))
# Output: "leetcode"
p(make_fancy_string("aaabaaaa"))
# Output: "aabaa"
p(make_fancy_string("aab"))
# Output: "aab"
