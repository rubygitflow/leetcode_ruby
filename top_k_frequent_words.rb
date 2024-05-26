# https://leetcode.com/problems/top-k-frequent-words/description/
# 692. Top K Frequent Words

# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  # dic = words.tally # {"the"=>4, "day"=>1, "is"=>3, "sunny"=>2}
  words.tally.max(k) {|(ka, va), (kb, vb)| va <=> vb }.map { _1[0] }
end

p top_k_frequent(["i","love","leetcode","i","love","coding"], 2)
# Output: ["i","love"]
p top_k_frequent(["the","day","is","sunny","the","the","the","sunny","is","is"], 4)
# Output: ["the","is","sunny","day"]
p top_k_frequent(["the","the","the","day","sunny","sunny","is","is","is"], 2)
# Output: ["the","is"]
p top_k_frequent(["the","the","the","day","sunny","sunny","is","is","is"], 6)
# Output: ["the","is","sunny","day"]
