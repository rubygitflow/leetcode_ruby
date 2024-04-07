# https://leetcode.com/problems/time-needed-to-buy-tickets/
# 2073. Time Needed to Buy Tickets

# @param {Integer[]} tickets
# @param {Integer} k
# @return {Integer}
def time_required_to_buy(tickets, k)
  tickets.each_with_index.map { |v, i| [v, i <= k ? tickets[k] : tickets[k]-1].min }.sum
end

p time_required_to_buy([2,3,2], 2)
# Output: 6
p time_required_to_buy([5,1,1,1], 0)
# Output: 8
p time_required_to_buy([5, 2, 3, 4], 2)
# Output: 10
