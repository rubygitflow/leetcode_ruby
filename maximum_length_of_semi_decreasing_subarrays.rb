# https://leetcode.com/problems/maximum-length-of-semi-decreasing-subarrays/description/
# 2863. Maximum Length of Semi-Decreasing Subarrays


INF = Float::INFINITY
# @param {Integer[]} nums
# @return {Integer}
def max_subarray_length_dec(nums)
  d = Hash.new { |h, k| h[k] = [] }
  nums.each_with_index {|x, i| d[x] << i}
  ans, k = 0, INF
  # Decreasing array
  d.keys.sort {|a,b| b <=> a}.each do |x|
    ans = [ans, d[x][-1] - k + 1].max
    k = [k, d[x][0]].min
  end
  ans
end

# @param {Integer[]} nums
# @return {Integer}
def max_subarray_length_inc(nums)
  d = Hash.new { |h, k| h[k] = [] }
  nums.each_with_index {|x, i| d[x] << i}
  ans, k = 0, INF
  # Increasing array
  d.keys.sort.each do |x|
    ans = [ans, d[x][-1] - k + 1].max
    k = [k, d[x][0]].min
  end
  ans
end

p("Semi-Decreasing Subarrays")
p max_subarray_length_dec([7,6,5,4,3,2,1,6,10,11])
# Output: 8
p max_subarray_length_dec([57,55,50,60,61,58,63,59,64,60,63])
# Output: 6
p max_subarray_length_dec([57,55,50,60,61,58,63,59,64,58,63])
# Output: 7
p max_subarray_length_dec([1,2,3,4])
# Output: 0
p max_subarray_length_dec([10,12,12,11,11])
# Output: 4

p("Semi-Increasing Subarrays")
p max_subarray_length_inc([11,10,6,1,2,3,4,5,6,7])
# Output: 8
p max_subarray_length_inc([63,59,64,60,63,55,57,50,60,61,58])
# Output: 9
p max_subarray_length_inc([57,55,50,60,61,58,63,59,64,58,63])
# Output: 11
p max_subarray_length_inc([1,2,3,4])
# Output: 4
p max_subarray_length_inc([101,92,53,4])
# Output: 0
p max_subarray_length_inc([11,11,12,12,10])
# Output: 4
