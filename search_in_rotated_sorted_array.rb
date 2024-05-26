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

########################
# https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/
# 153. Find Minimum in Rotated Sorted Array

# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  return nil if nums&.empty? || nums.nil?

  # nums.min  #   ;)

  return nums.first if nums.size == 1 || nums.first < nums.last

  l, r = 0, nums.size - 1
  border = nums.first
  output = border
  while l <= r
    mid = (l + r) / 2
    if nums[mid] > border
      l = mid + 1
    else
      r = mid - 1
      output = [output, nums[mid]].min
    end
  end
  output
end

p find_min([3,4,5,1,2])
# Output: 1
p find_min([4,5,6,7,0,1,2])
# Output: 0
p find_min([11,13,15,17])
# Output: 11
p find_min([11])
# Output: 11
