# https://leetcode.com/problems/corporate-flight-bookings/description/
# 1109. Corporate Flight Bookings

# @param {Integer[][]} bookings
# @param {Integer} n
# @return {Integer[]}
def corp_flight_bookings(bookings, n)
  output = [0] * n
  bookings.each do |first, last, seats|
    (first..last).each { |i| output[i - 1] += seats }
  end
  output
end

p corp_flight_bookings([[1,2,10],[2,3,20],[2,5,25]], 5)
# Output: [10,55,45,25,25]
p corp_flight_bookings([[1,2,10],[2,2,15]], 2)
# Output: [10,25]
