# https://leetcode.com/problems/maximum-total-importance-of-roads/description/
# 2285. Maximum Total Importance of Roads

# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
def maximum_importance(n, roads)
  deg = [0] * n
  for a, b in roads
    deg[a] += 1
    deg[b] += 1
  end
  deg.sort!
  # puts("Sorted list of road mentions: #{deg}")
  # Return the MAXIMUM total importance of all roads possible after assigning the values optimally:
  # assign each city with an integer value from 1 to n 
  # - for the most frequently mentioned road, assign the highest value
  deg.map.with_index(1) { |v,i| i * v }.sum
end

p maximum_importance(5,[[0,1],[1,2],[2,3],[0,2],[1,3],[2,4]])
# Output: 43
p maximum_importance(5,[[0,3],[2,4],[1,3]])
# Output: 20
