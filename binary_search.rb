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
  -1
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_ex(nums, target)
  nums.bsearch_index {|i| target <=> i } || -1
end

puts('Binary Search')
p search([-1,0,3,5,9,12], 9)
# Output: 4
p search([-1,0,3,5,9,12], 2)
# Output: -1

p search_ex([-1,0,3,5,9,12], 9)
# Output: 4
p search_ex([-1,0,3,5,9,12], 2)
# Output: -1


########################
# https://leetcode.com/problems/search-a-2d-matrix/description/
# 74. Search a 2D Matrix

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  l, r = 0, matrix.length - 1
  # first, find row m
  while l <= r do
    mid = (l + r) / 2
    if matrix[mid][0] == target or matrix[mid][-1] == target
      return true
    elsif (matrix[mid][0] < target) and (matrix[mid][-1] > target)
      return search(matrix[mid], target) > -1 ? true : false
    elsif matrix[mid][0] > target
      r = mid - 1
    else
      l = mid + 1
    end
  end
  false
end

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix_ex(matrix, target)
  line = matrix.bsearch {|str| str[0] <= target && str[-1] >= target}
  line.bsearch {|i| target <=> i} == target
end

puts('Search a 2D Matrix')
p search_matrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)
# Output: false
p search_matrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 23)
# Output: true
p search_matrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 34)
# Output: true

p search_matrix_ex([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)
# Output: false
p search_matrix_ex([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 23)
# Output: true
p search_matrix_ex([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 34)
# Output: true
