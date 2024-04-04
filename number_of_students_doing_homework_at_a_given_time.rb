# https://leetcode.com/problems/number-of-students-doing-homework-at-a-given-time/description/
# 1450. Number of Students Doing Homework at a Given Time

# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @param {Integer} query_time
# @return {Integer}
def busy_student(start_time, end_time, query_time)
  (0...start_time.size).count{|i| start_time[i] <= query_time && (end_time[i] or 0) >= query_time}
end

p busy_student([1,2,3], [3,2,7], 4)
# Output: 1
p busy_student([4], [4], 4)
# Output: 1
p busy_student([1,2,7], [2,2,8], 4)
# Output: 0
p busy_student([1,2,3], [12,22,18], 4)
# Output: 3
p busy_student([], [], 4)
# Output: 0
p busy_student([1], [], 4)
# Output: 0
p busy_student([], [4], 4)
# Output: 0
