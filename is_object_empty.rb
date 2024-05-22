# https://leetcode.com/problems/is-object-empty/description/
# 2727. Is Object Empty

def is_empty(obj)
  # obj.empty? rescue true
  obj.empty? rescue obj.nil?
end

p(is_empty({"x": 5, "y": 42}))
# Output: false
p(is_empty({}))
# Output: true
p(is_empty([nil, false, 0]))
# Output: false
p(is_empty([]))
# Output: true
p(is_empty('wer'))
# Output: false
p(is_empty(''))
# Output: true
p(is_empty(4.9))
# Output: /true?/ false
p(is_empty(nil))
# Output: true
p(is_empty([nil, false]))
# Output: false
