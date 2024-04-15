# https://leetcode.com/problems/squares-of-a-sorted-array/description/
# 977. Squares of a Sorted Array

# @param {Integer[]} nums
# @return {Integer[]}
def sorted_squares(nums)
  res = [] # Initialize an empty array to store squared values
  l = 0 # Initialize the left pointer to zero (IE, the LARGEST value of the "left" array)
  r = nums.size - 1 # Initialize the right pointer to the size of nums (IE, the LARGEST value for the "right" array)
  k = r # Initialize our "insert index". Because we are starting with the largest values and working our way inward, we will insert each value into the array starting at the end (IE, the largest index in nums)
  until k < 0 # Loop until we've exhausted all nums
    if nums[l].abs > nums[r].abs
      # If the module of|left| value is larger store it in our array at the current index and increment the left pointer
      res[k] = nums[l]**2
      l += 1
    else
      # Otherwise the module of |right| value is larger, store it at the current index and decrement the right pointer
      res[k] = nums[r]**2
      r -= 1
    end
    k -= 1 # We inserted one squared value into our final array, decrement the current index
  end
  res # Return the final array
end

p restore_string([-4,-1,0,3,10])
# Output: [0,1,9,16,100]
p restore_string([-7,-3,2,3,11])
# Output: [4,9,9,49,121]
