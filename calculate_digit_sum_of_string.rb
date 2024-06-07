# https://leetcode.com/problems/calculate-digit-sum-of-a-string/description/
# 2243. Calculate Digit Sum of a String

# @param {String} s
# @param {Integer} k
# @return {String}
def digit_sum(s, k)
  while s.size > k
    col, s = s.chars.each_with_object([[], '']) do |el, accum|
      accum[0] << el.to_i
      if accum[0].size == k
        accum[1] << accum[0].sum.to_s
        accum[0].clear
      end
    end
    s += col.sum.to_s if col.size > 0
  end
  s
end

# @param {String} s
# @param {Integer} k
# @return {String}
def digit_sum_ii(s, k)
  accum = []
  while s.size > k
    a = s.split("").map(&:to_i)
    accum.clear
    (0...a.size).step(k).each do |el|
      accum << a.slice(el,k).sum
    end
    s = accum.join("")
  end
  s
end

p digit_sum("11111222223", 3)
# Output: "135"
p digit_sum("00000000", 3)
# Output: "000"

p digit_sum_ii("11111222223", 3)
# Output: "135"
p digit_sum_ii("00000000", 3)
# Output: "000"
