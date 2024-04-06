# https://leetcode.com/problems/time-needed-to-inform-all-employees/description/
# 1376. Time Needed to Inform All Employees

# @param {Integer} n
# @param {Integer} head_id
# @param {Integer[]} manager
# @param {Integer[]} inform_time
# @return {Integer}
def num_of_minutes(n, head_id, manager, inform_time)
  @team = Hash.new { |h,k| h[k] = [] }
  manager.each_with_index do |manager, employee|
    @team[manager].push(employee)
  end
  dfs(head_id, inform_time)
end

def dfs(i, inform_time)
  output = 0
  @team[i].each do |el|
    output = [output, dfs(el, inform_time) + inform_time[i]].max
  end
  output
end

p num_of_minutes(1, 0, [-1], [0])
# Output: 0
p num_of_minutes(6, 2, [2,2,-1,2,2,2], [0,0,1,0,0,0])
# Output: 1
p num_of_minutes(9, 2, [2,2,-1,2,2,2,3,4,5], [0,0,1,2,2,1,1,1,1])
# Output: 3
