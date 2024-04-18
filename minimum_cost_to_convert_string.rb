# https://leetcode.com/problems/minimum-cost-to-convert-string-i/description/
# 2976. Minimum Cost to Convert String I

require 'set'

INF = Float::INFINITY

# @param {String} source
# @param {String} target
# @param {Character[]} original
# @param {Character[]} changed
# @param {Integer[]} cost
# @return {Integer}
def minimum_cost(source, target, original, changed, cost)
  def compare_all_paths(original, changed, cost)
    graph = Hash.new { |h,k| h[k] = Hash.new { |h,k| h[k] = 0 } }
    # fix initial costs
    original.zip(changed, cost).each do |ori, cha, cos|
      graph[ori][cha] = [graph[ori][cha], cos].max
    end
    # bypass all connections
    for k in (@original_set + @changed_set)   # intermediate bundle
      for i in @original_set                  # original bundle
        for j in @changed_set                 # changed bundle
          graph[i][j] = [
            (graph[i][j].zero? ? INF : graph[i][j]),
            (graph[i][k].zero? ? INF : graph[i][k]) +
              (graph[k][j].zero? ? INF : graph[k][j])
          ].min
        end
      end
    end
    graph
  end

  @original_set = Set[*original]
  @changed_set  = Set[*changed]
  actioned = source.chars.zip(target.chars)
  actioned_inp = actioned.filter_map { |v, w| v if v != w }
  actioned_out = actioned.filter_map { |v, w| w if v != w }
  return -1 if (actioned_inp.to_set - @original_set).any?
      
  return -1 if (actioned_out.to_set - @changed_set).any?

  min_paths = compare_all_paths(original, changed, cost)
  actioned_inp.zip(actioned_out).inject(0) { |res, val| res + min_paths[val[0]][val[1]] }
end

p minimum_cost("abcd","acbe",["a","b","c","c","e","d"],["b","c","b","e","b","e"],[2,5,5,1,2,20])
# Output: 28
p minimum_cost("aaaa","bbbb",["a","c"],["c","b"],[1,2])
# Output: 12
p minimum_cost("aaaa","bbbb",["a","c","a","d","e"],["c","b","d","e","b"],[3,2,1,1,1])
# Output: 12
p minimum_cost("abcd","abce",["a"],["e"],[10000])
# Output: -1
p minimum_cost("aaa","aaa",["a"],["e"],[10000])
# Output: 0
