# https://leetcode.com/problems/critical-connections-in-a-network/description/
# 1192. Critical Connections in a Network

# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer[][]}
def critical_connections(n, connections)
  def dfs(cur,prev)
    @visited[cur] = true
    @times += 1
    @discovered[cur] = @lowest[cur] = @times
    @graph[cur].each do |node|
      if !@visited[node]
        dfs(node, cur)
        @lowest[cur] = [@lowest[cur], @lowest[node]].min
      elsif node != prev
        @lowest[cur] = [@lowest[cur], @discovered[node]].min
      end
      @bridges << [cur, node] if @lowest[node] > @discovered[cur]
    end
  end

  @bridges = []
  @visited = Hash.new{|h, k| h[k] = false}
  @times = 0
  @discovered = [0] * n
  @lowest = [0] * n
  @graph = Hash.new{|h, k| h[k] = []}
  connections.each do |u, v|
    @graph[u] << v
    @graph[v] << u
  end
  (0...n).each do |i|
    dfs(i,-1) unless @visited[i]
  end
  @bridges
end

p critical_connections(4, [[0,1],[1,2],[2,0],[1,3]])
# Output: [[1,3]]
p critical_connections(2, [[0,1]])
# Output: [[0,1]]
# infinity sign
p critical_connections(5, [[0,1],[1,2],[2,0],[1,3],[3,4],[4,1]])
# Output: []
# dumbbell
p critical_connections(6, [[0,1],[1,2],[2,0],[1,3],[3,4],[4,5],[5,3]])
# Output: [[1,3]]
# 2 donuts
p critical_connections(7, [[0,1],[1,2],[2,0],      [3,4],[4,5],[5,3],[5,6]])
# Output: [[5,6]]
# star
p critical_connections(7, [[0,1],[0,2],[2,3],[0,4],[0,5],[5,6]])
# Output: [[0, 1], [2, 3], [0, 2], [0, 4], [5, 6], [0, 5]]
