# https://leetcode.com/problems/contains-duplicate/description/
# 217. Contains Duplicate

require 'set'

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  nums.tally.any? { _2 > 1 }
end

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate_alt(nums)
  # https://docs.ruby-lang.org/en/master/Set.html
  # Set[*nums].size != nums.size
  # No need to interate through the entire list. We return a boolean at the first duplicate
  visited = Set[]
  for num in nums
    return true unless visited.add?(num)
  end
  false
end

p contains_duplicate([1,2,3,1])
# Output: true
p contains_duplicate([1,2,3,4])
# Output: false
p contains_duplicate([1,1,1,3,3,4,3,2,4,2])
# Output: true

p contains_duplicate_alt([1,2,3,1])
# Output: true
p contains_duplicate_alt([1,2,3,4])
# Output: false
p contains_duplicate_alt([1,1,1,3,3,4,3,2,4,2])
# Output: true
