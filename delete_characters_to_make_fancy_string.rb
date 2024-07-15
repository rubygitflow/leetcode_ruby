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

require_relative 'test/cover_test_cases'
test_case "Delete Characters to Make Fancy String (reduce)" do
  p(make_fancy_string("leeetcode"))
  # Output: "leetcode"
  p(make_fancy_string("aaabaaaa"))
  # Output: "aabaa"
  p(make_fancy_string("aab"))
  # Output: "aab"
end

def make_fancy_string_ii(s)
  output = ''
  for c in s.chars
    next if output.size > 1 && output[-1] == c && output[-2] == c
    output += c
  end
  output
end

test_case "Delete Characters to Make Fancy String (FOR-loop)" do
  p(make_fancy_string_ii("leeetcode"))
  # Output: "leetcode"
  p(make_fancy_string_ii("aaabaaaa"))
  # Output: "aabaa"
  p(make_fancy_string_ii("aab"))
  # Output: "aab"
end
