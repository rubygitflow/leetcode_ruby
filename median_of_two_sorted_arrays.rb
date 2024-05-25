# https://leetcode.com/problems/median-of-two-sorted-arrays/description/
# 4. Median of Two Sorted Arrays

INF = Float::INFINITY
NEG_INF = -Float::INFINITY

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays_sort(nums1, nums2)
  return nil if (nums1.size + nums2.size).zero?

  combined = (nums1 + nums2).sort
  if combined.size.even?
    left_middle = (combined.size / 2) - 1
    (combined[left_middle] + combined[left_middle + 1]) / 2.0
  elsif combined.size.odd?
    middle = (combined.size / 2).to_i
    combined[middle].to_f
  else
    0.to_f
  end
end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  a, b = if nums1.size < nums2.size
           [nums1, nums2]
         else
           [nums2, nums1]
         end
  # Initialization
  la, lb = a.size, b.size
  return nil if (la + lb).zero?

  l, r = 0, la - 1
  half = (la + lb) / 2
  # Binary search loop in b
  while true
    i = (l + r) / 2  # Partition position in 'a'
    j = half - i - 2  # Complementary partition position in 'b'
    # Handling edge cases with '-inf' and 'inf'
    a_current =  (i >= 0) ? a[i] : NEG_INF
    a_right = (i + 1 < la) ? a[i + 1] : INF
    b_current = (j >= 0) ? b[j] : NEG_INF
    b_right = (j + 1 < lb) ? b[j + 1] : INF
    # Check if correct partition is found
    if a_current <= b_right && b_current <= a_right
        # Handle odd combined length
        if (la + lb).odd?
          return [a_right, b_right].min
        # Handle even combined length
        else
          return ([a_current, b_current].max + [a_right, b_right].min) / 2.0
        end
    elsif a_current > b_right
        r = i - 1  # Move partition in 'a' left
    else # b_current > a_right
        l = i + 1  # Move partition in 'a' right
    end
  end
end

p find_median_sorted_arrays_sort([1,3], [2])
# Output: 2.0
p find_median_sorted_arrays_sort([1,2], [3,4])
# Output: 2.5
p find_median_sorted_arrays_sort([19, 20], [1, 3, 5, 20])
# Output: 12.0
p find_median_sorted_arrays_sort([1, 3, 5, 7, 9], [0, 3, 4, 5, 6])
# Output: 4.5
p find_median_sorted_arrays_sort([11, 13, 15, 17, 19], [0, 3, 4, 5, 6])
# Output: 8.5
p find_median_sorted_arrays_sort([19, 20], [0, 3, 4, 5, 6])
# Output: 5.0
p find_median_sorted_arrays_sort([], [0, 3, 4, 5, 6])
# Output: 4.0
p find_median_sorted_arrays_sort([], [])
# Output: nil

p find_median_sorted_arrays([1,3], [2])
# Output: 2.00000
p find_median_sorted_arrays([1,2], [3,4])
# Output: 2.50000
p find_median_sorted_arrays([19, 20], [1, 3, 5, 20])
# Output: 12.0
p find_median_sorted_arrays([1, 3, 5, 7, 9], [0, 3, 4, 5, 6])
# Output: 4.5
p find_median_sorted_arrays([11, 13, 15, 17, 19], [0, 3, 4, 5, 6])
# Output: 8.5
p find_median_sorted_arrays([19, 20], [0, 3, 4, 5, 6])
# Output: 5.0
p find_median_sorted_arrays([], [0, 3, 4, 5, 6])
# Output: 4.0
p find_median_sorted_arrays([], [])
# Output: nil
