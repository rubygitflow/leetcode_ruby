# https://leetcode.com/problems/average-waiting-time/description/
# 1701. Average Waiting Time

# @param {Integer[][]} customers
# @return {Float}
def average_waiting_time(customers)
  return 0.0 if customers.size < 1

  output, at_free_time = 0, 0
  for at, wait in customers
    at_free_time = [at_free_time, at].max + wait
    output += at_free_time - at
  end
  output.to_f / customers.size
end

p average_waiting_time([[1,2],[2,5],[4,3]])
# Output: 5.0
p average_waiting_time([[5,2],[5,4],[10,3],[20,1]])
# Output: 3.25
