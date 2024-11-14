# https://leetcode.com/problems/advantage-shuffle/description/
# 870. Advantage Shuffle

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def advantage_count(nums1, nums2)
  return [] if nums2.size != nums1.size

  n = nums1.size
  output = Array.new(n, 0)
  nums1 = nums1.sort
  t = nums2.each_with_index.sort
  # puts "t: #{t}"
  l, r = 0, n-1
  for v in nums1
    if v <= t[l][0]
      output[t[r][1]] = v
      r -= 1
    else
      output[t[l][1]] = v
      l += 1
    end
    # puts "output: #{output}"
  end
  output
end

require_relative 'test/cover_test_cases'
test_case "Advantage Shuffle" do
  p advantage_count([2,7,11,15], [1,10,4,11])
  # Output: [2,11,7,15]
  p advantage_count([12,24,8,32], [13,25,32,11])
  # Output: [24,32,8,12]
  p advantage_count([12,24,8], [13,25,32,11])
  # Output: []
end
