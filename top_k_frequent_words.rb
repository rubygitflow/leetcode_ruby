# https://leetcode.com/problems/top-k-frequent-words/description/
# 692. Top K Frequent Words

# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  # dic = words.tally # {"the"=>4, "day"=>1, "is"=>3, "sunny"=>2}
  words.tally.max(k) {|(ka, va), (kb, vb)| va <=> vb }.map { _1[0] }
end

puts "Top K Frequent Words"
p top_k_frequent(["i","love","leetcode","i","love","coding"], 2)
# Output: ["i","love"]
p top_k_frequent(["the","day","is","sunny","the","the","the","sunny","is","is"], 4)
# Output: ["the","is","sunny","day"]
p top_k_frequent(["the","the","the","day","sunny","sunny","is","is","is"], 2)
# Output: ["the","is"]
p top_k_frequent(["the","the","the","day","sunny","sunny","is","is","is"], 6)
# Output: ["the","is","sunny","day"]


####################
# https://leetcode.com/problems/top-k-frequent-elements/description/
# 347. Top K Frequent Elements

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent_elements(nums, k = 0)
  k = k.abs
  k = nums.size if k.zero?
  # top_k_frequent(nums, k)
  nums.tally.max(k) {|(ka, va), (kb, vb)| va <=> vb }.map { _1[0] }
  # nums.tally.max(nums.size) {|(ka, va), (kb, vb)| va <=> vb }.map { _1[0] }.take(2) # Output: [10, 42]
end

puts "Top K Frequent Elements"
p top_k_frequent_elements([1,1,1,2,2,3], 2)
# Output: [1,2]
p top_k_frequent_elements([1], 1)
# Output: [1]
p top_k_frequent_elements([10,11,13,25,22,30,42,10], 2)
# Output: [10, 11] or [10, 13] or [10, 22] ...
p top_k_frequent_elements([10,11,13,25,22,30,42,10], 3)
# Output: [10, 11,25] or [10, 13,25] or [10, 22,30] ...
p top_k_frequent_elements([10,11,13,25,22,30,42,10], 0)
# Output: [10, 42, 30, 22, 25, 13, 11]
p top_k_frequent_elements([10,11,13,25,22,30,42,10], -2)
# Output: [10, 25] or [10, 11] or [10, 30] ...
p top_k_frequent_elements([1,1,1,2,2,3,0,0,0,5,5,5], 2)
# Output: [1,0] or [1,5] or [0,5]
p top_k_frequent_elements([1,1,1,2,2,3,5,5,5,0,0,0], 2)
# Output: [1,5] or [1,0] or [0,5]
