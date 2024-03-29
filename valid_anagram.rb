# https://leetcode.com/problems/valid-anagram/description/
# 242. Valid Anagram

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  # check if length is mismatching. If so it can't be anagram
  return false if s.length != t.length
    
  # for all characters from both of strings get the total
  # count of s and t and check if they are matching.
  # If not return false.
  for i in s.chars + t.chars
    if s.count(i) != t.count(i)
      return false
    end
  end
  return true
end

p is_anagram('ana👩ram', 'na👩aram')
# Output: true
p is_anagram('anagram', 'nagaram')
# Output: true
p is_anagram('anagram', 'nagram')
# Output: false
p is_anagram('rat', 'car')
# Output: false
