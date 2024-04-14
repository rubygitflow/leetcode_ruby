# https://leetcode.com/problems/shuffle-string/description/
# 1528. Shuffle String

# @param {String} s
# @param {Integer[]} indices
# @return {String}
def restore_string(s, indices)
  output = '_' * s.size
  indices.each_with_index {|v,i| output[v] = s[i]}
  output
end

p restore_string("codeleet", [4,5,6,7,0,2,1,3])
# Output: "leetcode"
p restore_string("abc", [0,1,2])
# Output: "abc"
