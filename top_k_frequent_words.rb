# https://leetcode.com/problems/top-k-frequent-words/description/
# 692. Top K Frequent Words

# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent_words(words, k)
  # dic = words.tally # {"the"=>4, "day"=>1, "is"=>3, "sunny"=>2}
  words.tally.max(k.zero? ? words.size : k.abs) {|(ka, va), (kb, vb)| va == vb ? kb <=> ka : va <=> vb }.map { _1[0] }
end

require_relative 'test/cover_test_cases'
test_case "Top K Frequent Words (max)" do
  p(top_k_frequent_words(["i","love","leetcode","i","love","coding"], 2))
  # Output: ["i","love"]
  p(top_k_frequent_words(["the","day","is","sunny","the","the","the","sunny","is","is"], 4))
  # Output: ["the","is","sunny","day"]
  p(top_k_frequent_words(["the","the","the","day","sunny","sunny","is","is","is"], 2))
  # Output: ["is", "the"]
  p(top_k_frequent_words(["the","the","the","day","sunny","sunny","is","is","is"], 6))
  # Output: ["is", "the", "sunny", "day"]
end


# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent_words_ii(words, k)
  words.tally.sort_by {|word, count|  [-count, word] }.take(k.zero? ? words.size : k.abs).map { _1[0] }
end

test_case "Top K Frequent Words (sort_by)" do
  p(top_k_frequent_words_ii(["i","love","leetcode","i","love","coding"], 2))
  # Output: ["i","love"]
  p(top_k_frequent_words_ii(["the","day","is","sunny","the","the","the","sunny","is","is"], 4))
  # Output: ["the","is","sunny","day"]
  p(top_k_frequent_words_ii(["the","the","the","day","sunny","sunny","is","is","is"], 2))
  # Output: ["is", "the"]
  p(top_k_frequent_words_ii(["the","the","the","day","sunny","sunny","is","is","is"], 6))
  # Output: ["is", "the", "sunny", "day"]
end


####################
# https://leetcode.com/problems/top-k-frequent-elements/description/
# 347. Top K Frequent Elements


# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent_elements(nums, k = 0)
  nums.tally.max(k.zero? ? nums.size : k.abs) {|(ka, va), (kb, vb)| va == vb ? kb <=> ka : va <=> vb }.map { _1[0] }
end

test_case "Top K Frequent Elements (max)" do
  p(top_k_frequent_elements([1,1,1,2,2,3], 2))
  # Output: [1,2]
  p(top_k_frequent_elements([1], 1))
  # Output: [1]
  p(top_k_frequent_elements([10,11,13,25,22,30,42,10], 2))
  # Output: [10, 11]
  p(top_k_frequent_elements([10,11,13,25,22,30,42,10], 3))
  # Output: [10, 11, 13]
  p(top_k_frequent_elements([10,11,13,25,22,30,42,10], 0))
  # Output: [10, 11, 13, 22, 25, 30, 42]
  p(top_k_frequent_elements([10,11,13,25,22,30,42,10], -2))
  # Output: [10, 11]
  p(top_k_frequent_elements([1,1,1,2,2,3,0,0,0,5,5,5], 2))
  # Output: [0, 1]
  p(top_k_frequent_elements([1,1,1,2,2,3,5,5,5,0,0,0], 2))
  # Output: [0, 1]
end


# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent_elements_ii(nums, k = 0)
  nums.tally.sort {|(ka, va), (kb, vb)| va == vb ? ka <=> kb : vb <=> va }.take(k.zero? ? nums.size : k.abs).map { _1[0] }
end

test_case "Top K Frequent Elements (sort)" do
  p(top_k_frequent_elements_ii([1,1,1,2,2,3], 2))
  # Output: [1,2]
  p(top_k_frequent_elements_ii([1], 1))
  # Output: [1]
  p(top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], 2))
  # Output: [10, 11]
  p(top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], 3))
  # Output: [10, 11, 13]
  p(top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], 0))
  # Output: [10, 11, 13, 22, 25, 30, 42]
  p(top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], -2))
  # Output: [10, 11]
  p(top_k_frequent_elements_ii([1,1,1,2,2,3,0,0,0,5,5,5], 2))
  # Output: [0, 1]
  p(top_k_frequent_elements_ii([1,1,1,2,2,3,5,5,5,0,0,0], 2))
  # Output: [0, 1]
end
