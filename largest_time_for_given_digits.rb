# https://leetcode.com/problems/largest-time-for-given-digits/description/
# 949. Largest Time for Given Digits

# @param {Integer[]} arr
# @return {String}
def largest_time_from_digits(arr)
  def minute_first_digit(arr, res)
    res + arr[0].to_s
  end

  def minute_second_digit(arr, res)
    out = (0..5).to_a.reverse.find { |el| arr.delete(el) } 
    return '' unless out

    minute_first_digit(arr, res + out.to_s)
  end

  def hour_first_digit(arr, res)
    out = (0..(res == '2' ? 3 : 9)).to_a.reverse.find { |el| arr.delete(el) } 
    return '' unless out

    minute_second_digit(arr, res + "#{out}:")
  end

  out = (0..2).to_a.reverse.find { |el| arr.delete(el) } 
  return '' unless out

  hour_first_digit(arr, out.to_s)
end

def largest_time_from_digits_ex(a)
  x = a.permutation.select do |x|
    x[0]*10+x[1] < 24 && x[2]*10 + x[3] < 59
  end.map{ |x| [x,60*(x[0]*10+x[1]) + x[2]*10+x[3]] }
  return "" if x.empty?

  x = x.max_by{ |x| x[1] }
  "#{x[0][0]}#{x[0][1]}:#{x[0][2]}#{x[0][3]}"
end

puts 'Largest Time for Given Digits'
p largest_time_from_digits([1,5,3,4])
# Output: "15:43"
p largest_time_from_digits([1,2,3,4])
# Output: "23:41"
p largest_time_from_digits([5,5,5,5])
# Output: ""
p largest_time_from_digits([0,9,9,9])
# Output: ""

puts 'Largest Time for Given Digits (with permutations)'
p largest_time_from_digits_ex([1,5,3,4])
# Output: "15:43"
p largest_time_from_digits_ex([1,2,3,4])
# Output: "23:41"
p largest_time_from_digits_ex([5,5,5,5])
# Output: ""
p largest_time_from_digits_ex([0,9,9,9])
# Output: ""
