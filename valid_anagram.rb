# https://leetcode.com/problems/valid-anagram/description/
# 242. Valid Anagram

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  # Time complexity: O(s^2)+O(t^2)
  # Space complexity: O(s)+O(t)

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

# @param {String} s
# @return {Hash}
def anagrammable(s, case_sensitive = true)
  # hash = Hash.new { |h,k| h[k] = 0 }
  # (case_sensitive ? s : s.downcase ).each_char {|letter|  hash[letter] += 1 }
  # hash
  (case_sensitive ? s : s.downcase ).each_char.tally
end

def is_anagram_ex(s, t, case_sensitive = true)
  # Time complexity: O(s)+O(t)
  # Space complexity: O(s)+O(t)
  anagrammable(s, case_sensitive) == anagrammable(t, case_sensitive)
end

puts "Valid Anagram"
puts "is_anagram"
p is_anagram('ana👩ram', 'na👩aram')
# Output: true
p is_anagram('anagram', 'nagaram')
# Output: true
p is_anagram('anagram', 'nagram')
# Output: false
p is_anagram('rat', 'car')
# Output: false
# Case sensitive!!!
p is_anagram('anagram', 'naGaram')
# Output: false

puts "is_anagram_ex"
p is_anagram_ex('ana👩ram', 'na👩aram')
# Output: true
p is_anagram_ex('anagram', 'nagaram')
# Output: true
p is_anagram_ex('anagram', 'nagram')
# Output: false
p is_anagram_ex('rat', 'car')
# Output: false
# Case sensitive!!!
p is_anagram_ex('anagram', 'naGaram')
# Output: false
# Case insensitive!!!
p is_anagram_ex('anagram', 'naGaram', false)
# Output: true

##################
# https://leetcode.com/problems/group-anagrams/description/
# 49. Group Anagrams

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  # Time complexity: len(strs)*O(nlog⁡n)
  # Space complexity: len(strs)*O(n)
  # ---
  # where n is the length of the input strings

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

puts "Group Anagrams"
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


##################
# https://leetcode.com/problems/find-resultant-array-after-removing-anagrams/description/
# 2273. Find Resultant Array After Removing Anagrams

# @param {String[]} words
# @return {String[]}
def remove_anagrams(words)
  return [] if !words || words.empty?

  last_anagram = anagrammable(words[0])
  output = [words[0]]
  words[1..].each do |word|
    current_anagram = anagrammable(word)
    if current_anagram != last_anagram
      last_anagram = current_anagram
      output << word
    end
  end
  output
end

puts "Find Resultant Array After Removing Anagrams"
p remove_anagrams(["abba","baba","bbaa","cd","cd"])
# Output: ["abba","cd"]
p remove_anagrams(["abba","bbaa","cd","cd","baba"])
# Output: ["abba","cd","baba"]
p remove_anagrams(["a","b","c","d","e"])
# Output: ["a","b","c","d","e"]
p remove_anagrams(nil)
# Output: []
p remove_anagrams([])
# Output: []


##################
# https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram-ii/description/
# 2186. Minimum Number of Steps to Make Two Strings Anagram II

# @param {String} s
# @param {String} t
# @return {Integer}
def min_steps_ii(s, t)
  a, b = anagrammable(s), anagrammable(t)
  (a.keys - b.keys + b.keys).reduce(0) do
    # _1 - accumulator ;  _2 - key
    _1 + ((a[_2] || 0) - (b[_2] || 0)).abs
  end
end

puts "Minimum Number of Steps to Make Two Strings Anagram II"
p min_steps_ii("leetcode", "coats")
# Output: 7
p min_steps_ii("night", "thing")
# Output: 0
p min_steps_ii("n👩ght🌄Прога", "Парго🐃th👩ng")
# Output: 2

##################
# https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram/description/
# 1347. Minimum Number of Steps to Make Two Strings Anagram

# @param {String} s
# @param {String} t
# @return {Integer}
def min_steps(s, t)
  return if s.size != t.size

  a, b = anagrammable(s), anagrammable(t)
  b.keys.reduce(0) do
    # _1 - accumulator ;  _2 - key
    _1 +  if a.key?(_2)
            difference = b[_2] - a[_2]
            difference.positive? ? difference : 0
          else
            b[_2]
          end
  end
end

puts "Minimum Number of Steps to Make Two Strings Anagram"
p min_steps("bab", "aba")
# Output: 1
p min_steps("leetcode", "practice")
# Output: 5
p min_steps("anagram", "mangaar")
# Output: 0
p min_steps("n👩ght🌄Прога", "t👩ghn🐃Прога")
# Output: 1
p min_steps("leetcode", "practic")
# Output: nil
