# https://leetcode.com/problems/rearrange-characters-to-make-target-string/description/
# 2287. Rearrange Characters to Make Target String

# @param {String} s
# @param {String} target
# @return {Integer}
def rearrange_characters(s, target)
    tc = target.chars.tally
    sc = s.chars.tally
    tc.map { |k, v| sc.fetch(k,0) / v }.min
end

p rearrange_characters("ilovecodingonleetcode","code")
# Output: 2
p rearrange_characters("abcba","abc")
# Output: 1
p rearrange_characters("abbaccaddaeea","aaaaa")
# Output: 1
p rearrange_characters("abbaccaddaeea","фd")
# Output: 0
