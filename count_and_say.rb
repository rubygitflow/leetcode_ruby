# https://leetcode.com/problems/count-and-say/description/
# 38. Count and Say
# https://en.wikipedia.org/wiki/Run-length_encoding
# Explanation: https://algo.monster/liteproblems/38

# @param {Integer} n
# @return {String}
def count_and_say(n)
  sequence = '1'
  for _ in (0...n-1)
    temp_sequence = ''
    index = 0
    while index < sequence.size
      count_index = index
      count_index += 1 while count_index < sequence.size && sequence[count_index] == sequence[index]
      temp_sequence += (count_index - index).to_s
      temp_sequence += sequence[index]
      index = count_index
    end
    sequence = temp_sequence
  end
  sequence
end


# @param {Integer} n
# @return {String}
def count_and_say_ii(n)
  if n == 1
    '1'
  else
    count_and_say_ii(n - 1)
    .chars
    .chunk { _1 }
    .map { "#{_1[1].size}#{_1[0]}" }
    .join
  end
end

p count_and_say(4)
# Output: "1211"
p count_and_say(1)
# Output: "1"
# p count_and_say(10)
# # Output: "13211311123113112211"

p count_and_say_ii(4)
# Output: "1211"
p count_and_say_ii(1)
# Output: "1"
# p count_and_say_ii(10)
# # Output: "13211311123113112211"
