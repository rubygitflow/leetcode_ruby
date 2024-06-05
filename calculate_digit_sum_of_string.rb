# https://leetcode.com/problems/calculate-digit-sum-of-a-string/description/
# 2243. Calculate Digit Sum of a String

# @param {String} s
# @param {Integer} k
# @return {String}
def digit_sum(s, k)
  while s.size > 3
    col, s = s.chars.each_with_object([[], '']) do |el, out|
      out[0] << el.to_i
      if out[0].size == k
        out[1] << out[0].sum.to_s
        out[0].clear
      end
      out
    end
    s += col.sum.to_s if col.size > 0
  end
  s
end

p digit_sum("11111222223", 3)
# Output: "135"
p digit_sum("00000000", 3)
# Output: "000"
