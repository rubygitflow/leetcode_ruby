# https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/description/
# 1700. Number of Students Unable to Eat Lunch

# @param {Integer[]} students
# @param {Integer[]} sandwiches
# @return {Integer}
def count_students(students, sandwiches)
  hungry = 0
  while students.size > hungry
    if students[0] == sandwiches[0]
      sandwiches.shift
      hungry = 0
    else
      students << students[0]
      hungry+=1
    end
    students.shift
  end
  students.size
end

# @param {Integer[]} students
# @param {Integer[]} sandwiches
# @return {Integer}
def count_students_ex(students, sandwiches)
  cnt = students.partition(&:zero?).map(&:count)
  for type in sandwiches
    break if cnt[type].zero?
    cnt[type] -= 1
  end
  cnt.sum
end

p count_students([1,1,0,0], [0,1,0,1])
# Output: 0 
p count_students([1,1,1,0,0,1], [1,0,0,0,1,1])
# Output: 3
p count_students([0,0,0,1,1,0], [1,0,0,0,1,1])
# Output: 1
p count_students([0,0,0,1,1,0], [0,1,1,1,0,0])
# Output: 3

p count_students_ex([1,1,0,0], [0,1,0,1])
# Output: 0 
p count_students_ex([1,1,1,0,0,1], [1,0,0,0,1,1])
# Output: 3
p count_students_ex([0,0,0,1,1,0], [1,0,0,0,1,1])
# Output: 1
p count_students_ex([0,0,0,1,1,0], [0,1,1,1,0,0])
# Output: 3

