# https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
# 3. Longest Substring Without Repeating Characters

require 'set'

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  char_set = Set.new
  l = 0
  max_length = 0
  for r in (0...s.length)
    until char_set.add?(s[r])
      # delete char from l
      char_set.delete(s[l])
      l += 1
      # readd char to r
    end
    max_length = [max_length, char_set.length].max
  end
  max_length
end

p "Longest Substring Without Repeating Characters"
p length_of_longest_substring("abcabcbb")
# Output: 3
p length_of_longest_substring("bbbbb")
# Output: 1
p length_of_longest_substring("pwwkew")
# Output: 2

# a list of strings of a given length from the dict_array dictionary
# @param {String} s
# @param {Integer} length
# @return {Integer}
def fetch_lists_by_length(s, length)
  dict_array = {}
  char_set = Set.new
  l = 0
  for r in (0...s.length)
    until char_set.add?(s[r])
      # delete char from l
      char_set.delete(s[l])
      l += 1
      # readd char to r
    end
    dict_array[l] = s[l, r - l + 1]
  end
  dict_array.each_with_object([]) do |(_, el), acc|
    acc << el if el.size == length && !acc.include?(el)
  end
end

p "List of strings of a given length from dict_array"
p fetch_lists_by_length("abcabcbb", 3)
# Output: ["abc", "bca", "cab"]
p fetch_lists_by_length("bbbbb", 3)
# Output: []
p fetch_lists_by_length("pwwkew", 3)
# Output: ["wke", "kew"]


# dict_array, filtered by the length of the string with unique values
# @param {String} s
# @return {Integer}
def range_dict_array(s)
  dict_array = {}
  char_set = Set.new
  l = 0
  for r in (0...s.length)
    until char_set.add?(s[r])
      # delete char from l
      char_set.delete(s[l])
      l += 1
      # readd char to r
    end
    dict_array[l] = s[l, r - l + 1]
  end
  dict_array.values.group_by { |el| el.length }.each_pair { |key, value| {key => value.uniq!} }
end

puts "dict_array, filtered by the length of the string with unique values"
p range_dict_array("abcabcbb")
# Output: {3: ['abc', 'bca', 'cab'], 2: ['cb'], 1: ['b']}
p range_dict_array("bbbbb")
# Output: {1=>["b"]}
p range_dict_array("pwwkew")
# Output: {2=>["pw"], 3=>["wke", "kew"]}
