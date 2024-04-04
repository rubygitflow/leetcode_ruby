# https://leetcode.com/problems/detect-pattern-of-length-m-repeated-k-or-more-times/description/
# 1566. Detect Pattern of Length M Repeated K or More Times

# @param {Integer[]} arr
# @param {Integer} m
# @param {Integer} k
# @return {Boolean}
def contains_pattern(arr, m, k)
  arr.size.times do |i|
    return true if arr[i...i+m]*k == arr[i...i+m*k]
  end
  return false
end

p contains_pattern([1,2,4,4,4,4], 1, 3)
# Output: true
p contains_pattern([1,2,1,2,1,1,1,3], 2, 2)
# Output: true
p contains_pattern([1,2,1,2,1,3], 2, 3)
# Output: false
p contains_pattern([1,2,1,2], 2, 3)
# Output: false

