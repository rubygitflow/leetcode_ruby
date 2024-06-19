# https://leetcode.com/problems/multiply-strings/description/
# 43. Multiply Strings
# Simulating Mathematical Multiplication: digit by digit

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  return '0' if num1 == '0' || num2 == '0'

  out = [0] * (num1.size + num2.size)
  (0...num1.size).to_a.reverse.each do |i|
    (0...num2.size).to_a.reverse.each do |j|
      sum = out[i+j+1] + num1[i].to_i * num2[j].to_i
      out[i+j+1] = sum % 10
      out[i+j] += sum / 10
    end
  end
  out.shift() if out[0] == 0
  out.join('')
end


p(multiply("2", "3"))
# Output: "6"
p(multiply("123", "456"))
# Output: "56088"
p(multiply("999", "9"))
# Output: "8991"
