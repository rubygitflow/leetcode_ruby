# https://leetcode.com/problems/minimum-time-to-make-rope-colorful/description/
# 1578. Minimum Time to Make Rope Colorful

# @param {String} colors
# @param {Integer[]} needed_time
# @return {Integer}
def min_cost(colors, needed_time)
  time = 0
  return -1 if colors.size != needed_time.size
  (1...colors.size).each do |i|
    if colors[i] == colors[i - 1]
      time += [needed_time[i], needed_time[i - 1]].min
      needed_time[i] = [needed_time[i], needed_time[i - 1]].max
    end
  end
  time
end

p min_cost(
  "abaacs",
  [1,2,3,4,5]
)
# Output: -1
p min_cost(
  "abaac",
  [1,2,3,4,5]
)
# Output: 3
p min_cost(
  "abc",
  [1,2,3]
)
# Output: 0
p min_cost(
  "aabaa",
  [1,2,3,4,1]
)
# Output: 2
p min_cost(
  "abaaac",
  [1,2,3,4,1,5]
)
# Output: 4
