# https://leetcode.com/problems/valid-parentheses/description/
# 20. Valid Parentheses

# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = [] # only use append and pop
  pairs = {
      '(' => ')',
      '{' => '}',
      '[' => ']'
  }
  s.chars.each do |bracket|
    if pairs.key?(bracket)
      stack << bracket
    elsif stack.size == 0 || bracket != pairs[stack.pop]
      return false
    end
  end
  return stack.size == 0
end

p(is_valid("()[]{}"))
# Output: true
p(is_valid("(]"))
# Output: false
