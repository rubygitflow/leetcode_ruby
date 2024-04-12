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
