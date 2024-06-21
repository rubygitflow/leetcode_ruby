# https://leetcode.com/problems/container-with-most-water/description/
# 11. Container With Most Water

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  l, r = 0, height.size - 1
  out = 0
  while l < r
    out = [out, [height[l], height[r]].min * (r - l)].max
    if height[l] < height[r]
      l += 1
    else
      r -= 1
    end
  end
  out
end

puts("Container With Most Water")
p(max_area([1,8,6,2,5,4,8,3,7]))
# Output: 49
p(max_area([1,1]))
# Output: 1


########################
# https://leetcode.com/problems/trapping-rain-water/description/
# 42. Trapping Rain Water


# @param {Integer[]} height
# @return {Integer}
def trap(height)
  l, r = 0, height.size - 1
  l_max, r_max = 0, 0
  total_water = 0
  while l <= r
    # when the left pointer has more height than left max
    # assign the left max to height at left
    if height[l] <= height[r]
      if height[l] >= l_max
        l_max = height[l]
      # if the height is less than left max
      # it means it can entrap water so adding this to total water
      else
        total_water += l_max - height[l]
      end
      l += 1
    else
      if height[r] >= r_max
        r_max = height[r]
      else
        total_water += r_max - height[r]
      end
      r -= 1
    end
  end
  total_water
end

puts("Trapping Rain Water")
p(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
# Output: 6
p(trap([4,2,0,3,2,5]))
# Output: 9
