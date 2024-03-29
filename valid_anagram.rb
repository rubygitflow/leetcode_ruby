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


# https://leetcode.com/problems/group-anagrams/description/
# 49. Group Anagrams

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  return [strs] if strs.length == 1 || strs.length == 0

  hash = Hash.new { |h,k| h[k] = [] }
  # This creates a hash where the default value
  # for a non-existing key is an empty array [].
  # It uses a block to define the default value, and
  # the block is executed each time a non-existing key is accessed.
  strs.each do |str|
    sorted_str = str.chars.sort.join
    hash[sorted_str] << str
  end
  hash.values
end

def group_anagrams_ex(strs)
  strs.sort.group_by { |word| word.chars.sort }.values
end

p group_anagrams(["eat","tea","tan","ate","nat","bat"])
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
p group_anagrams([""])
# Output: [[""]]
p group_anagrams(["a"])
# Output: [["a"]]

p group_anagrams_ex(["eat","tea","tan","ate","nat","bat"])
# Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
p group_anagrams_ex([""])
# Output: [[""]]
p group_anagrams_ex(["a"])
# Output: [["a"]]
