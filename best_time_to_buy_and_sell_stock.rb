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
