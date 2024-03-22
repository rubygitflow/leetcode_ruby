# https://leetcode.com/problems/find-minimum-time-to-finish-all-jobs/description/
# 1723. Find Minimum Time to Finish All Jobs

# @param {Integer[]} jobs
# @param {Integer} k
# @return {Integer}
def minimum_time_required(jobs, k)
  return 0 if k.zero?
  x = jobs.sort { |a,b| b <=> a }
  avg = (x.sum / k).ceil
  baskets = [0] * k
  basket_num = 0
  while x.length > 0 do
    i = 0
    baskets[basket_num] = x.shift
    avg = [avg, baskets[basket_num]].max 
    while i < x.length do
      if baskets[basket_num] + x[i] <= avg
        baskets[basket_num] += x.slice!(i, 1)[0]
      else
        i += 1
      end
    end
    if basket_num < k - 1 
      basket_num += 1
    else
      baskets[basket_num] += x.sum
      x = []
    end
  end
  baskets.max
end

p minimum_time_required([3,2,3], 3)
# Output: 3
p minimum_time_required([1,2,4,7,8], 2)
# Output: 11
p minimum_time_required([4,7,8], 2)
# Output: 11
p minimum_time_required([24,17,28], 2)
# Output: 41
