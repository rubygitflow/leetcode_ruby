# https://leetcode.com/problems/find-the-longest-balanced-substring-of-a-binary-string/description/
# 2609. Find the Longest Balanced Substring of a Binary String

# @param {String} s
# @return {Integer}
def find_the_longest_balanced_substring(s)
  (s.scan(/0+1+/).map { |s| [s.count(?0), s.count(?1)].min }.max || 0) * 2
end

p find_the_longest_balanced_substring("01000111")
# Output: 6
p find_the_longest_balanced_substring("00111")
# Output: 4
p find_the_longest_balanced_substring("111")
# Output: 0
p find_the_longest_balanced_substring("111011")
# Output: 2
