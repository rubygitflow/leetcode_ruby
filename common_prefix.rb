# https://leetcode.com/problems/longest-common-prefix/description/
# 14. Longest Common Prefix

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.size < 2

  strs[0].chars.each_with_index do |char, i|
    strs[1..].each do |word|
      return strs[0][0...i] if word.length<=i || word[i] != char
    end
  end
  strs[0]
end


puts("Longest Common Prefix")
p(longest_common_prefix(["flower","flow","flight"]))
# Output: "fl"
p(longest_common_prefix(["dog","racecar","car"]))
# Output: ""
p(longest_common_prefix(["flow","flow","flow"]))
# Output: "flow"
p(longest_common_prefix(["dog"]))
# Output: ""
