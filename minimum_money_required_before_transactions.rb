# https://leetcode.com/problems/minimum-money-required-before-transactions/description/
# 2412. Minimum Money Required Before Transactions
# Explanation from https://algo.monster/liteproblems/2412

# @param {Integer[][]} transactions
# @return {Integer}
def minimum_money(transactions)
  # Calculate the initial sum required to cover all negative cash flows,
  # i.e., where the cost of a transaction is higher than the cashback
  total_negative_cash_flow = transactions.reduce(0) do |res,(cost, cashback)|
    res + [0, cost - cashback].max
  end

  # # Initialize maximum additional money required at the start as zero
  # max_additional_money_required = 0
  # # Iterate through all transactions to determine the maximum additional money
  # # required at the start to not end up with a negative balance at any point
  # for (cost, cashback) in transactions
  #   if cost > cashback
  #     # If transaction cost is higher than cashback, calculate additional money
  #     # required by considering the total negative cash flow and cashback of
  #     # the current transaction
  #     max_additional_money_required = [max_additional_money_required, total_negative_cash_flow + cashback].max
  #   else
  #     # If transaction cost is lower or equal to cashback,
  #     # calculate by considering total negative cash flow and cost of
  #     # the current transaction
  #     max_additional_money_required = [max_additional_money_required, total_negative_cash_flow + cost].max
  #   end
  # end
  # # Return the maximum additional money that is required at the beginning
  # max_additional_money_required

  transactions.reduce(0) do |max_additional_money_required,(cost, cashback)|
    [
      max_additional_money_required,
      cost > cashback ?
      total_negative_cash_flow + cashback :
      total_negative_cash_flow + cost
    ].max
  end
end

p minimum_money([[2,1],[5,0],[4,2]])
# Output: 10
p minimum_money([[3,0],[0,3]])
# Output: 3
p minimum_money([[7, 2], [5, 0], [4, 1], [5, 8], [5, 9], [0, 10]])
# Output: 18
