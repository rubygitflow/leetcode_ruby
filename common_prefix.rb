# https://leetcode.com/problems/longest-common-prefix/description/
# 14. Longest Common Prefix

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.size < 2

  strs[0].chars.each_with_index do |char, i|
    strs[1..].each do |word|
      return strs[0][0...i] if word.length<=i || word[i] != char
    end
  end
  strs[0]
end


puts("Longest Common Prefix")
p(longest_common_prefix(["flower","flow","flight"]))
# Output: "fl"
p(longest_common_prefix(["dog","racecar","car"]))
# Output: ""
p(longest_common_prefix(["flow","flow","flow"]))
# Output: "flow"
p(longest_common_prefix(["dog"]))
# Output: ""


########################
# https://leetcode.com/problems/find-the-length-of-the-longest-common-prefix/description/
# 3043. Find the Length of the Longest Common Prefix

require 'set'

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer}
def longest_common_prefix_at_least_one(arr1, arr2)
  return 0 if arr1.size < 1 or arr2.size < 1

  acc = Set[]
  for x in arr1
    while x>0
      acc.add(x)
      x /= 10
    end
  end
  out = 0
  for x in arr2
    while x>0 && x > 10 ** out
      if acc.include?(x)
        out = [out, x.to_s.length].max
        break
      end
      x /= 10
    end
  end
  out
end

puts("Find the Length of the Longest Common Prefix")
p(longest_common_prefix_at_least_one([1,10,100], [1000, 1]))
# Output: 3
p(longest_common_prefix_at_least_one([1,2,3], [4,4,4]))
# Output: 0
p(longest_common_prefix_at_least_one([1,2,3], []))
# Output: 0
