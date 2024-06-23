# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
# 121. Best Time to Buy and Sell Stock

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.size < 2

  max_price, l, r = 0, 0, 1
  while r < prices.size
    if prices[l] < prices[r]
      max_price = [max_price, prices[r] - prices[l]].max
    else
      l = r
    end
    r += 1
  end
  max_price
end


puts("Best Time to Buy and Sell Stock")
p(max_profit([7,1,5,3,6,4]))
# Output: 5
p(max_profit([7,6,4,3,1]))
# Output: 0


#######################
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/
# 122. Best Time to Buy and Sell Stock II


# @param {Integer[]} prices
# @return {Integer}
def max_profit_ii(prices)
  prices.each_cons(2).reduce(0) { |profit, (prev, curr)| profit + [curr - prev, 0].max }
end

# @param {Integer[]} prices
# @return {Integer}
def max_profit_ii_ex(prices)
  return 0 if prices.size < 2

  prices.reduce([0,prices[0]]) do |acc, curr|
    [acc[0] + [curr - acc[1], 0].max, curr]
  end.fetch(0)
end


puts("Best Time to Buy and Sell Stock II")
p(max_profit_ii([7,1,5,3,6,4]))
# Output: 7
p(max_profit_ii([1,2,3,4,5]))
# Output: 4
p(max_profit_ii([7,6,4,3,1]))
# Output: 0
p(max_profit_ii([7]))
# Output: 0
p(max_profit_ii([]))
# Output: 0

p(max_profit_ii_ex([7,1,5,3,6,4]))
# Output: 7
p(max_profit_ii_ex([1,2,3,4,5]))
# Output: 4
p(max_profit_ii_ex([7,6,4,3,1]))
# Output: 0
p(max_profit_ii_ex([7]))
# Output: 0
p(max_profit_ii_ex([]))
# Output: 0


#######################
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/description/
# 123. Best Time to Buy and Sell Stock III


# @param {Integer[]} prices
# @return {Integer}
def max_profit_iii(prices)
  return 0 if prices.size < 2

  prices.reduce([[0], prices[0]]) do |rising_trans, curr|
    if curr > rising_trans[1]
      rising_trans[0][-1] += curr - rising_trans[1]
      [rising_trans[0] , curr]
    elsif curr < rising_trans[1]
      [rising_trans[0].push(0), curr]
    else
      rising_trans
    end
  end.fetch(0).max(2).sum
end


puts("Best Time to Buy and Sell Stock III")
p(max_profit_iii([3,3,5,0,0,3,1,4]))
# Output: 6
p(max_profit_iii([1,2,3,4,5]))
# Output: 4
p(max_profit_iii([7,6,4,3,1]))
# Output: 0


# ######################
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/description/
# 188. Best Time to Buy and Sell Stock IV

# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit_iv(k, prices)
  return 0 if prices.size < 2

  prices.reduce([[0], prices[0]]) do |rising_trans, curr|
    if curr > rising_trans[1]
      rising_trans[0][-1] += curr - rising_trans[1]
      [rising_trans[0] , curr]
    elsif curr < rising_trans[1]
      [rising_trans[0].push(0), curr]
    else
      rising_trans
    end
  end.fetch(0).max(k).sum
end


puts("Best Time to Buy and Sell Stock IV")
p(max_profit_iv(2, [2,4,1]))
# Output: 2
p(max_profit_iv(2, [3,2,6,7,5,0,3]))
# Output: 8
p(max_profit_iv(2, [3,2,6,5,0,3]))
# Output: 7


#######################
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/description/
# 309. Best Time to Buy and Sell Stock with Cooldown
# Explanation: https://algo.monster/liteproblems/309

# @param {Integer[]} prices
# @return {Integer}
def max_profit_with_hold(prices)
  return 0 if prices.size < 2

  prices[1..-1].reduce([0, -prices.first, 0]) {|(sold, hold, rest), price|
    [[hold + price, sold].max, [rest - price, hold].max, [sold, hold, rest].max]
  }.max
end


puts("Best Time to Buy and Sell Stock with Cooldown")
p(max_profit_with_hold([1,2,3,0,2]))
# Output: 3
p(max_profit_with_hold([1]))
# Output: 0
