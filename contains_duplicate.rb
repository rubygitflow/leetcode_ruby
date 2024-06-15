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

puts("Contains Duplicate (hash)")
p contains_duplicate([1,2,3,1])
# Output: true
p contains_duplicate([1,2,3,4])
# Output: false
p contains_duplicate([1,1,1,3,3,4,3,2,4,2])
# Output: true

puts("Contains Duplicate (set)")
p contains_duplicate_alt([1,2,3,1])
# Output: true
p contains_duplicate_alt([1,2,3,4])
# Output: false
p contains_duplicate_alt([1,1,1,3,3,4,3,2,4,2])
# Output: true


####################
# https://leetcode.com/problems/contains-duplicate-ii/description/
# 219. Contains Duplicate II

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  visited = {}
  nums.each_with_index do |num, i|
    return true if visited.key?(num) && i - visited[num] <= k

    visited[num] = i
  end
  false
end

puts("Contains Duplicate II")
p(contains_nearby_duplicate([1,2,3,1], 3))
# Output: true
p(contains_nearby_duplicate([1,0,1,1], 1))
# Output: true
p(contains_nearby_duplicate([1,2,3,1,2,3], 2))
# Output: false
