# https://leetcode.com/problems/3sum/description/
# 15. 3Sum

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  output = []
  return output if nums.length < 3

  nums.sort!
  nums.each_with_index do |num, index|
    # If we have same element on left of the index,
    # then it will give same subset again... [-3,-3,1,2]
    # In this case, after first iteration we will get a subset [-3,1,2] and
    # In 2nd we must not make a duplicate subset
    # we have this checker num == nums[index - 1], if matches will go to next iteration
    next if index > 0 && num == nums[index - 1]

    # the next number of num on left, and last number on right
    left = index + 1
    right = nums.length - 1
    # sorted array, so loop will run till right is higher number
    while left < right
      # We will take the summation of 3 of them
      summation = nums[index] + nums[left] + nums[right]
      # if 0, then we will save the subset in output array
      if summation == 0
        output << [nums[index], nums[left], nums[right]]
        # We have to avoid duplicate next value, so we will increase left index by 1
        # and we have to check if the previous index matched and also the right index is higher
        # if both TRUE then we will increase left by 1 again
        left += 1
        left += 1 while nums[left] == nums[left - 1] && left < right
        # if summation is smaller than zero, increase left index, cz array is sorted
      elsif summation < 0
        left += 1
        # if summation is higher than zero, decrease right index, cz array is sorted
      elsif summation > 0
        right -= 1
      end
    end
  end
  output
end

p three_sum([-1,0,1,2,-1,-4])
# Output: [[-1,-1,2],[-1,0,1]]
p three_sum([0,1,1])
# Output: []
p three_sum([0,0,0])
# Output: [[0,0,0]]
