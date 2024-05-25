# https://leetcode.com/problems/longest-palindromic-substring/description/
# 5. Longest Palindromic Substring

# @param {String} s
# @return {String}
def longest_palindrome(s)
  length = s.size
  max_length = 0
  output = ''
  (1...length).each do |i|
    # even Palindrome
    #                l.. <- -> i..r
    l, r = i - 1, i
    while l > -1 && r < length
      if s[l] == s[r]
        current =  r - l + 1
        if current > max_length
          max_length = current
          output = s[l,current]
        end
        l -= 1
        r += 1
      else
        break
      end
    end
    # odd Palindrome
    #                l.. <- i -> ..r
    l, r = i - 1, i + 1
    while l > -1 and r < length
      if s[l] == s[r]
        current =  r - l + 1
        if current > max_length
          max_length = current
          output = s[l,current]
        end
        l -= 1
        r += 1
      else
        break
      end
    end
  end
  output
end

p longest_palindrome('hjlsirulivjjjlsjdjsalkjd')
# Output: 'sjdjs'
p longest_palindrome('hjllllllsirulivjjjlsjdjsalkjd')
# Output: 'llllll'
p longest_palindrome('babad')
# Output: 'bab'
p longest_palindrome('cbbd')
# Output: 'bb'
