# https://leetcode.com/problems/minimum-cost-to-convert-string-i/description/
# 2976. Minimum Cost to Convert String I

require 'set'

INF = Float::INFINITY
def compare_all_paths(original, changed, cost)
  graph = Hash.new { |h,k| h[k] = Hash.new { |h,k| h[k] = 0 } }
  # fix initial costs
  # Step _: Populate substring distances matrix
  original.zip(changed, cost).each do |ori, cha, cos|
    graph[ori][cha] = [graph[ori][cha], cos].max
  end
  # bypass all connections
  # Step _: Floyd-Warshall algorithm to calculate minimum distances between substrings
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

# @param {String} source
# @param {String} target
# @param {Character[]} original
# @param {Character[]} changed
# @param {Integer[]} cost
# @return {Integer}
def minimum_cost_I(source, target, original, changed, cost)
  # Step _: Initialize necessary data structures and variables
  @original_set = Set[*original]
  @changed_set  = Set[*changed]
  actioned = source.chars.zip(target.chars)
  actioned_inp = actioned.filter_map { |v, w| v if v != w }
  actioned_out = actioned.filter_map { |v, w| w if v != w }

  # Step _:  proactive exit
  return -1 if (actioned_inp.to_set - @original_set).any?

  return -1 if (actioned_out.to_set - @changed_set).any?

  min_paths = compare_all_paths(original, changed, cost)

  # Step _: "Dynamic programming" to find minimum cost
  output = actioned_inp.zip(actioned_out).inject(0) { |res, val| res + min_paths[val[0]][val[1]] }
  output.infinite? ? -1 : output
end

p("Minimum Cost to Convert String I")

p minimum_cost_I("abcd","acbe",["a","b","c","c","e","d"],["b","c","b","e","b","e"],[2,5,5,1,2,20])
# Output: 28 (5 > 1+2)
p(minimum_cost_I("abcd","acbe",["a","b","c","c","f","e","d"],["b","c","b","f","e","b","e"],[2,5,5,1,2,1,20]))
# Output: 29 (5 > 1+2+1)
p minimum_cost_I("aaaa","bbbb",["a","c"],["c","b"],[1,2])
# Output: 12
p minimum_cost_I("aaaa","bbbb",["a","c"],["d","b"],[1,2])
# Output: -1
p minimum_cost_I("aaaa","bbbb",["a","c","a","d","e"],["c","b","d","e","b"],[3,2,1,1,1])
# Output: 12
p minimum_cost_I("abcd","abce",["a"],["e"],[10000])
# Output: -1
p minimum_cost_I("aaa","aaa",["a"],["e"],[10000])
# Output: 0


#######################
# https://leetcode.com/problems/minimum-cost-to-convert-string-ii/description/
# 2977. Minimum Cost to Convert String II

# @param {String} source
# @param {String} target
# @param {String[]} original
# @param {String[]} changed
# @param {Integer[]} cost
# @return {Integer}
def minimum_cost_II(source, target, original, changed, cost)
  # Step _: Initialize necessary data structures and variables
  @original_set = Set[*original]
  @changed_set  = Set[*changed]
  source_len = source.length
  dp = [INF] * (source_len + 1)

  min_paths = compare_all_paths(original, changed, cost)

  # Step _: "Dynamic programming" to find minimum cost
  # output = actioned_inp.zip(actioned_out).inject(0) { |res, val| res + min_paths[val[0]][val[1]] }
  dp[0] = 0
  (0...source_len).each do |i|
    next if dp[i] == INF

    source_char = source[i]
    target_char = target[i]
    dp[i + 1] = [dp[i + 1], dp[i]].min if source_char == target_char
    @original_set.each do |substring|
      substring_len = substring.length
      next if i + substring_len > source_len

      sub_source = source[i,substring_len]
      sub_target = target[i,substring_len]
      next if !@original_set.include?(sub_source) || !@changed_set.include?(sub_target)

      if min_paths[sub_source][sub_target] != INF
        dp[i + substring_len] = [
          dp[i + substring_len],
          dp[i] + min_paths[sub_source][sub_target]
        ].min
      end
    end
  end
  dp[source_len].infinite? ? -1 : dp[source_len]
end

p("Minimum Cost to Convert String II")

p minimum_cost_II("abcd","acbe",["a","b","c","c","e","d"],["b","c","b","e","b","e"],[2,5,5,1,2,20])
# Output: 28
p minimum_cost_II("fgh","ghh",["bcd","fgh","thh"],["cde","thh","ghh"],[1,3,5])
# Output: 8
p minimum_cost_II("fgh","ghh",["fgh","f","g","thh"],["thh","g","h","ghh"],[3,1,1,5])
# Output: 2 (1+1 < 3+5)
p minimum_cost_II("fgh","f&&",["fgh","fgh"],["f&&","f&"],[11,1])
# Output: 11
p minimum_cost_II("abcdefgh","acdeeghh",["bcd","fgh","thh"],["cde","thh","ghh"],[1,3,5])
# Output: 9
p minimum_cost_II("abcdefgh","addddddd",["bcd","defgh"],["ddd","ddddd"],[100,1578])
# Output: -1
p minimum_cost_II("aaa","aaa",["a"],["e"],[10000])
# Output: 0
