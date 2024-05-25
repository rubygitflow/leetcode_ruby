# https://leetcode.com/problems/find-the-longest-balanced-substring-of-a-binary-string/description/
# 2609. Find the Longest Balanced Substring of a Binary String

# @param {String} s
# @return {Integer}
def find_the_longest_balanced_substring(s)
  (s.scan(/0+1+/).map { |s| [s.count(?0), s.count(?1)].min }.max || 0) * 2
end

puts "find_the_longest_balanced_substring"
p find_the_longest_balanced_substring("01000111")
# Output: 6
p find_the_longest_balanced_substring("00111")
# Output: 4
p find_the_longest_balanced_substring("111")
# Output: 0
p find_the_longest_balanced_substring("111011")
# Output: 2

def find_the_longest_balanced_substring_ii(s)
  out = 0
  zeros = 0
  ones = 0
  s.each_char do |letter|
    if letter=="0"
      if ones==0
        # continue counting
        zeros += 1
      else
        # break counting
        ones = 0
        zeros = 1
      end
    elsif letter=="1"
      if zeros>0
        ones += 1
        # compare ones with zeros and add to result
        out = [zeros, ones].min
      end
    end
  end
  # fix the result
  out * 2
end

puts "find_the_longest_balanced_substring_ii"
p find_the_longest_balanced_substring_ii("01000111")
# Output: 6
p find_the_longest_balanced_substring_ii("00111")
# Output: 4
p find_the_longest_balanced_substring_ii("111")
# Output: 0
p find_the_longest_balanced_substring_ii("111011")
# Output: 2
