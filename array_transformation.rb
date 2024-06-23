# https://leetcode.com/problems/array-transformation/description/
# 1243. Array Transformation

# On the i-th day, you do the following operations on the array of day i-1 to produce the array of day i:
# If an element is smaller than both its left neighbor and its right neighbor, then this element is incremented.
# If an element is bigger than both its left neighbor and its right neighbor, then this element is decremented.
# The first and last elements never change.
# After some days, the array does not change. Return that final array.

# @param {Array} arr
# @return {Array}
def transform_array(arr)
  transformable = true
  while transformable
    transformable = false
    t = arr.dup # arr.copy
    (1...t.size - 1).each do |i|
      if t[i] > t[i - 1] && t[i] > t[i + 1]
        arr[i] -= 1
        transformable = true
      elsif t[i] < t[i - 1] && t[i] < t[i + 1]
        arr[i] += 1
        transformable = true
      end
    end
  end
  arr
end

p transform_array([6,2,3,4])
# Output: [6,3,3,4]
p transform_array([1,6,3,4,3,5])
# Output: [1,4,4,4,4,5]
p transform_array([1,5])
# Output: [1,5]
