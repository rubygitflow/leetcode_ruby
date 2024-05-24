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
        unless char_set.add?(s[r])
            char_set.delete(s[l])
            l += 1
        end

        max_length = [max_length, char_set.length].max
    end
    max_length
end

p length_of_longest_substring("abcabcbb")
# Output: 3
p length_of_longest_substring("bbbbb")
# Output: 1
p length_of_longest_substring("pwwkew")
# Output: 2
