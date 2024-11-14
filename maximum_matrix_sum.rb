# https://leetcode.com/problems/maximum-matrix-sum/description/
# 1975. Maximum Matrix Sum

INF = Float::INFINITY

# @param {Integer[][]} matrix
# @return {Integer}
def max_matrix_sum(matrix)
  total, cnt, mi = 0, 0, INF
  for row in matrix
    for v in row
      total += v.abs
      mi = [mi, v.abs].min
      cnt += 1 if v < 0
    end
  end
  return total if cnt.even? || mi == 0

  total - mi * 2
end

# https://ruby-doc.org/3.3.0/Enumerable.html#method-i-reduce
# https://ruby-doc.org/3.3.0/Enumerable.html#method-i-inject
# @param {Integer[][]} matrix
# @return {Integer}
def max_matrix_sum_ii(matrix)
  total, cnt, mi = matrix.flatten.reduce([0, 0, INF]) do |(total, cnt, mi), elem|
    [
      total + elem.abs,
      elem < 0 ? cnt + 1 : cnt,
      [mi, elem.abs].min
    ]
  end
  cnt.even? || mi == 0 ? total : total - mi * 2
end

# https://ruby-doc.org/3.3.0/Enumerable.html#method-i-each_with_object
# @param {Integer[][]} matrix
# @return {Integer}
def max_matrix_sum_iii(matrix)
  total, cnt, mi = matrix.flatten.each_with_object([0, 0, INF]) do |elem, acc|
    acc[0] += elem.abs
    acc[1] +=1 if elem < 0
    acc[2] = [acc[2], elem.abs].min
  end
  cnt.even? || mi == 0 ? total : total - mi * 2
end

require_relative 'test/cover_test_cases'
test_case "Maximum Matrix Sum (FOR-loop)" do
  p(max_matrix_sum([[1,-1],[-1,1]]))
  # Output: 4
  p(max_matrix_sum([[1,2,3],[-1,-2,-3],[1,2,3]]))
  # Output: 16
end

test_case "Maximum Matrix Sum (reduce)" do
  p(max_matrix_sum_ii([[1,-1],[-1,1]]))
  # Output: 4
  p(max_matrix_sum_ii([[1,2,3],[-1,-2,-3],[1,2,3]]))
  # Output: 16
end

test_case "Maximum Matrix Sum (each_with_object)" do
  p(max_matrix_sum_iii([[1,-1],[-1,1]]))
  # Output: 4
  p(max_matrix_sum_iii([[1,2,3],[-1,-2,-3],[1,2,3]]))
  # Output: 16
end
