# https://leetcode.com/problems/binary-search/description/
# 704. Binary Search

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  l , r = 0 , nums.size - 1
  while l <= r
    mid = (l + r)/2
    if target === nums[mid]
      return mid
    elsif target < nums[mid]
      r = mid - 1
    else 
      l = mid + 1
    end
  end
  return -1
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_ex(nums, target)
  nums.bsearch_index {|i| target <=> i } || -1
end

p search([-1,0,3,5,9,12], 9)
# Output: 4
p search([-1,0,3,5,9,12], 2)
# Output: -1

p search_ex([-1,0,3,5,9,12], 9)
# Output: 4
p search_ex([-1,0,3,5,9,12], 2)
# Output: -1
