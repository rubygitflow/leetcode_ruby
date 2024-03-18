# https://leetcode.com/problems/latest-time-by-replacing-hidden-digits/description/
# 1736. Latest Time by Replacing Hidden Digits

# @param {String} time
# @return {String}
def maximum_time(time)
  time.chars.each.with_index{ |c, i| time[i] = position_to_time(i, time) if c == "?" }    
  time
end

def position_to_time(position, time) 
  case position
    when 0
       time[position].to_i <= 3 ? 2 : 1
    when 1
      time[0].to_i == 2 ? 3 : 9    
    when 3
      5
    when 4
      9
  end.to_s  
end

puts maximum_time("2?:?0")
# Output: "23:50"
puts maximum_time("0?:3?")
# Output: "09:39"
puts maximum_time("1?:22")
# Output: "19:22"
