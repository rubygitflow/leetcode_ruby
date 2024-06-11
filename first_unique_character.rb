# https://leetcode.com/problems/first-unique-character-in-a-string/description/
# 387. First Unique Character in a String

# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  cnt = s.chars.tally
  # i = 0
  # for c in s.chars
  #   return i if cnt[c] == 1
  #   i += 1
  # end
  s.chars.each_with_index do |c, i|
    return i if cnt[c] == 1
  end 
  return -1
end

p first_uniq_char("leetcode")
# Output: 0
p first_uniq_char("loveleetcode")
# Output: 2
p first_uniq_char("aabb")
# Output: -1
