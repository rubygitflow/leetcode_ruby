# https://leetcode.com/problems/last-stone-weight/description/
# 1046. Last Stone Weight

# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight(stones)
  until stones.length <= 1
    u = stones.max
    stones.delete_at(stones.rindex(u))
    v = stones.max
    stones.delete_at(stones.rindex(v))
    stones.push(u - v) if u > v
  end
  stones[0] ? stones[0] : 0
end

puts('Last Stone Weight')
p last_stone_weight([2,7,4,1,8,2])
# Output: 0
p last_stone_weight([2,7,4,1,8,1])
# Output: 1
p last_stone_weight([1])
# Output: 1
p last_stone_weight([31,26,33,21,40])
# Output: 9


#######################
# https://leetcode.com/problems/last-stone-weight-ii/description/
# 1049. Last Stone Weight II

require 'set'

# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight_ii(stones)
  prev_state = Set[0]
  stones.each do |elem|
    state = Set[]
    prev_state.each do |prev|
      state.add(prev + elem).add((prev - elem).abs)
    end
    prev_state = state
  end
  prev_state.min
end

puts('Last Stone Weight II')
p last_stone_weight_ii([2,7,4,1,8,2])
# Output: 0
p last_stone_weight_ii([2,7,4,1,8,1])
# Output: 1
p last_stone_weight_ii([31,26,33,21,40])
# Output: 5
