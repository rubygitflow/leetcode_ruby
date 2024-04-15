# https://leetcode.com/problems/sliding-window-median/
# 480. Sliding Window Median

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float[]}
def median_sliding_window(nums, k)
  odd = k.odd? ? true : false
  median_index = k / 2
  median_index -= 1 unless odd
  res = []
  median_index_next = median_index + 1
  (k..nums.size).each do |i|
    window = nums[(i-k)...i].sort
    res << (odd ? window[median_index] : (window[median_index] + window[median_index_next]) / 2.0)
  end
  res
end

p("Sliding Window Median")
p median_sliding_window([1,3,-1,-3,5,3,6,7], 3)
# Output: [1, -1, -1, 3, 5, 6]
p median_sliding_window([1,2,3,4,2,3,1,4,2], 3)
# Output: [2, 3, 3, 3, 2, 3, 2]
p median_sliding_window([1,3,-1,-3,5,3,6,7], 4)
# Output: [0.0, 1.0, 1.0, 4.0, 5.5]


#######################
# https://leetcode.com/problems/sliding-window-maximum/description/
# 239. Sliding Window Maximum

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  (k..nums.size).to_a.map {|i| nums[(i-k)...i].max}
end

p("Sliding Window Maximum")
p max_sliding_window([1,3,-1,-3,5,3,6,7], 3)
# Output: [3,3,5,5,6,7]
p max_sliding_window([1], 1)
# Output: [1]
