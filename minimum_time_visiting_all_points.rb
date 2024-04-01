# https://leetcode.com/problems/minimum-time-visiting-all-points/description/
# 1266. Minimum Time Visiting All Points

# @param {Integer[][]} points
# @return {Integer}
def min_time_to_visit_all_points(points)
  return 0 if points.size < 2
  
  output = 0
  (1...points.size).each do |i|
    output += [(points[i][0] - points[i-1][0]).abs, (points[i][1] - points[i-1][1]).abs].max
  end      
  output
end

p min_time_to_visit_all_points([[1,1],[3,4],[-1,0]])
# Output: 7
p min_time_to_visit_all_points([[3,2],[-2,2]])
# Output: 5
p min_time_to_visit_all_points([[3,2]])
# Output: 0
