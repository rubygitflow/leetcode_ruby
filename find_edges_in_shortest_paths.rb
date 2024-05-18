# https://leetcode.com/problems/find-edges-in-shortest-paths/description/
# 3123. Find Edges in Shortest Paths

# https://support.leetcode.com/hc/en-us/articles/360011833974-What-are-the-environments-for-the-programming-languages
# https://github.com/kanwei/algorithms
# gem install algorithms

require 'algorithms'

INF = Float::INFINITY
# @param {Integer} n
# @param {Integer[][]} edges
# @return {Boolean[]}
def find_answer(n, edges)
  def dijkstra(source, graph)
    pq = Containers::PriorityQueue.new {|x, y| (x <=> y) == -1}
    pq.push([0, source], source)
    dist = {source => 0}
    while pq.size > 0 do
      d, cur = pq.pop
      next if d != dist[cur]

      graph[cur].each do |nb, w|
        if dist.fetch(nb, INF) > d + w
          dist[nb] = d + w
          pq.push([dist[nb], nb], nb)
        end
      end
    end
    dist
  end

  graph = Hash.new { |h,k| h[k] = Hash.new { |h,k| h[k] = 0 } }
  edges.each do |(a, b, w)|
    graph[a][b] = w
    graph[b][a] = w
  end
  # p graph
  source_dist = dijkstra(0, graph)
  # pp('source_dist',source_dist)
  target_dist = dijkstra(n - 1, graph)
  # pp('target_dist',target_dist)

  # there is no path between nodes
  return [false] * edges.size if !source_dist.key?(n - 1)

  d = source_dist[n-1]
  # let's consider edges as a complement of oncoming paths
  edges.each_with_object([]) do |(a, b, w), ans|
    ans << (
      source_dist.fetch(a, INF) + w + target_dist.fetch(b, INF) == d ||
      source_dist.fetch(b, INF) + w + target_dist.fetch(a, INF) == d
    )
  end 
end

p find_answer(6,[[0,1,4],[0,2,1],[1,3,2],[1,4,3],[1,5,1],[2,3,1],[3,5,3],[4,5,2]])
# Output: [true,true,true,false,true,true,true,false]
p find_answer(4,[[2,0,1],[0,1,1],[0,3,4],[3,2,2]])
# Output: [true,false,false,true]
