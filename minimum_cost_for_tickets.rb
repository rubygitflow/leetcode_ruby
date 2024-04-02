# https://leetcode.com/problems/minimum-cost-for-tickets/description/
# 983. Minimum Cost For Tickets

# @param {Integer[]} days
# @param {Integer[]} costs
# @return {Integer}
def mincost_tickets(days, costs)
  is_travels = (days.last + 1).times.map{|day| days.include?(day) ? true : false}
  dp = [0]*(days.last + 1)
  (1..days.last).each do |day|
    dp[day] = if is_travels[day]
      dp[day] = [
        dp[day-1] + costs[0],
        dp[[day-7, 0].max] + costs[1],
        dp[[day-30, 0].max] + costs[2]
      ].min
    else
      dp[day-1]
    end
  end
  dp[days.last]
end

p mincost_tickets([1,4,6,7,8,20], [2,7,15])
# Output: 11
p mincost_tickets([1,2,3,4,5,6,7,8,9,10,30,31], [2,7,15])
# Output: 17
p mincost_tickets([1,24,146], [2,7,15])
# Output: 6
