# https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/description/
# 1443. Minimum Time to Collect All Apples in a Tree

# @param {Integer} n
# @param {Integer[][]} edges
# @param {Boolean[]} has_apple
# @return {Integer}
def min_time(n, edges, has_apple)
  g = Array.new(n) { Array.new }
  edges.each do |(u, v)|
      g[u] << v
      g[v] << u
  end
  vis = [false] * n

  dfs = -> u, cost do
    # skip visited paths
    return 0 if vis[u]

    vis[u] = true
    nxt_cost = 0
    # collect all paths
    g[u].each {|v| nxt_cost += dfs.(v, 2)}
    return 0 if !has_apple[u] && nxt_cost == 0

    # add "last mile" cost
    return cost + nxt_cost
  end

  dfs.(0, 0)
end

p min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,true,false,true,true,false])
# Output: 8 
p min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,true,false,false,true,false])
# Output: 6
p min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,false,false,false,false,false])
# Output: 0
p min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[true,false,false,false,false,false,false])
# Output: 0
p min_time(9,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6],[4,7],[4,8]],[false,false,false,false,false,false,false,false,true])
# Output: 6
p min_time(9,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6],[4,7],[4,8]],[false,true,false,false,true,false,false,false,true])
# Output: 6
