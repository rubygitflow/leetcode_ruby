# https://leetcode.com/problems/minimum-speed-to-arrive-on-time/
# 1870. Minimum Speed to Arrive on Time

# @param {Integer[]} dist
# @param {Float} hour
# @return {Integer}
def min_speed_on_time(dist, hour)
  # Return the minimum positive integer speed (in kilometers per hour)
  # that all the trains must travel at for you to reach the office on time,
  # or -1 if it is impossible to be on time.
  return -1 if dist.size > hour.round

  speed = (dist.sum.to_f / hour).ceil
  forecast_hour = 0
  last_item = dist.size - 1
  dist.each_with_index do |d, i|
    if i == last_item
      # already in place and we shouldn't round forecast_hour up 
      forecast_hour += d / speed
    else
      # Each train can only depart at an integer hour,
      # so you may need to wait in between each train ride.
      forecast_hour += (d / speed).ceil
    end
  end
  # Are we not late?
  forecast_hour > hour ? speed + 1 : speed
end

p min_speed_on_time([1,3,2], 6)
# Output: 1
p min_speed_on_time([1,3,2], 2.7)
# Output: 3
p min_speed_on_time([1,3,2], 1.9)
# Output: -1
