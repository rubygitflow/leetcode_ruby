# https://leetcode.com/problems/water-and-jug-problem/description/
# 365. Water and Jug Problem

# @param {Integer} x      jug1_capacity
# @param {Integer} y      jug2_capacity
# @param {Integer} target target_capacity
# @return {Boolean}
def can_measure_water(x, y, target)
  definition = x - y
  summ = x + y

  target % x == 0 ||
  target % y == 0 ||
  target % definition == 0 ||
  target % summ == 0 ||
  target % x % definition == 0 ||
  target % y % definition == 0 ||
  target % summ % definition == 0
end

p can_measure_water(2,3,1)
# Output: true
p can_measure_water(4,5,11)
# Output: true
p can_measure_water(2,6,5)
# Output: false
p can_measure_water(3,5,4)
# Output: true
p can_measure_water(1,2,3)
# Output: true
