# https://leetcode.com/problems/merge-intervals/description/
# 56. Merge Intervals

# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  output = []
  intervals.sort.each do |e|
    if output.empty?
      output << e
    else
      l, r = output[-1]
      if e[0] <= r && e[1] >= l
        output[-1] = [[e[0], l].min, [e[1], r].max]
      else
        output << e
      end
    end
  end
  output
end


p(merge([[1,3],[2,6],[8,10],[15,18]]))
# Output: [[1,6],[8,10],[15,18]]
p(merge([[1,3],[15,18],[2,6],[8,10]]))
# Output: [[1,6],[8,10],[15,18]]
p(merge([[1,4],[4,5]]))
# Output: [[1,5]]
p(merge([]))
# Output: []
p(merge([[-11,40],[1,4],[4,5]]))
# Output: [[-11,40]]
