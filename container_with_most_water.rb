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
