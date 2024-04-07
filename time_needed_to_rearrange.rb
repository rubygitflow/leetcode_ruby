# https://leetcode.com/problems/time-needed-to-rearrange-a-binary-string/description/
# 2380. Time Needed to Rearrange a Binary String

# @param {String} s
# @return {Integer}
def seconds_to_remove_occurrences(s)
  s.each_char.reduce([0, 0]) do |(zeroes, output), char|
    if char == "1"
      if zeroes.positive?
        output = [output + 1, zeroes].max
      end
    else
      zeroes += 1
    end
    [zeroes, output]
  end[1]
end

p seconds_to_remove_occurrences("000111")
# Output: 5
p seconds_to_remove_occurrences("0110001")
# Output: 4
p seconds_to_remove_occurrences("0110101")
# Output: 4
p seconds_to_remove_occurrences("11100")
# Output: 0
