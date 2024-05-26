# https://leetcode.com/problems/search-in-rotated-sorted-array/description/
# 33. Search in Rotated Sorted Array

# You must write an algorithm with O(log n) runtime complexity.
# Binary search

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  l, r = 0, nums.size - 1
  result = -1
  while l <= r
    mid = (l + r) / 2
    if nums[mid] == target
      result = mid
      break
    end
    
    # left half is sorted
    if nums[l] < nums[mid]
      # target is in sorted left half
      if nums[l] <= target && target <= nums[mid]
        r = mid - 1
      else
        l = mid + 1
      end
    # right half is sorted
    else
      # target is in sorted right half
      if nums[mid] < target && target <= nums[r]
        l = mid + 1
      else
        r = mid - 1
      end
    end
  end
  result
end

p search([4,5,6,7,0,1,2], 0)
# Output: 4
p search([4,5,6,7,0,1,2], 3)
# Output: -1
p search([1], 0)
# Output: -1

########################
# https://leetcode.com/problems/search-in-rotated-sorted-array-ii/description/
# 81. Search in Rotated Sorted Array II

# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search_ii(nums, target)
  # nums.include?(target)     ;)

  search(nums, target) > -1
end

p search_ii([2,5,6,0,0,1,2], 0)
# Output: true
p search_ii([2,5,6,0,0,1,2], 3)
# Output: false
