# https://leetcode.com/problems/first-letter-to-appear-twice/description/
# 2351. First Letter to Appear Twice

# @param {String} s
# @return {Character}
def repeated_character(s)
  s.chars.each_with_object(Hash.new(0)) do |letter, hash|
    hash[letter] += 1
    return letter if hash[letter] > 1
  end
  ''
end

p repeated_character("abccbaabz")
# Output: "c"
p repeated_character("abcdd")
# Output: "d"
p repeated_character("abcdef")
# Output: ""
