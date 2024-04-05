# https://leetcode.com/problems/existence-of-a-substring-in-a-string-and-its-reverse/description/
# 3083. Existence of a Substring in a String and Its Reverse

# @param {String} s
# @return {Boolean}
def is_substring_present(s)
  rev = s.reverse
  (0...s.size-1).each do |i|
    return true if rev.include?(s[i,2])
  end
  return false
end

p is_substring_present("leetcode")
# Output: true
p is_substring_present("abcba")
# Output: true
p is_substring_present("abcd")
# Output: false
