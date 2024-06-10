# https://leetcode.com/problems/rearrange-characters-to-make-target-string/description/
# 2287. Rearrange Characters to Make Target String

# @param {String} s
# @param {String} target
# @return {Integer}
def rearrange_characters(s, target)
  tc = target.chars.tally
  sc = s.chars.tally
  tc.map { |k, v| sc.fetch(k,0) / v }.min
end

puts "Rearrange Characters to Make Target String"
p rearrange_characters("ilovecodingonleetcode","code")
# Output: 2
p rearrange_characters("abcba","abc")
# Output: 1
p rearrange_characters("abbaccaddaeea","aaaaa")
# Output: 1
p rearrange_characters("abbaccaddaeea","фd")
# Output: 0


# https://leetcode.com/problems/sum-of-unique-elements/
# 1748. Sum of Unique Elements

# @param {Integer[]} nums
# @return {Integer}
def sum_of_unique(nums)
  nums.tally.filter_map {|k,v| k if v == 1}.sum
end

puts "Sum of Unique Elements"
p sum_of_unique([1,2,3,2])
# Output: 4
p sum_of_unique([1,1,1,1,1])
# Output: 0
p sum_of_unique([1,2,3,4,5])
# Output: 15
