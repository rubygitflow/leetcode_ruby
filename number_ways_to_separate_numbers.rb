# https://leetcode.com/problems/number-of-ways-to-separate-numbers/description/
# 1977. Number of Ways to Separate Numbers
# Explanation: https://algo.monster/liteproblems/1977

MOD = 10**9 + 7

# @param {String} num
# @return {Integer}
def number_of_combinations(num)
  # Helper function to compare the lexicographical order of two numbers within 'num'
  # representing the start indices and their length 'length'.
  def is_greater_or_equal(start1, start2, length, num, longest_common_prefix)
    common_prefix_length = longest_common_prefix[start1][start2]
    common_prefix_length >= length ||
    num[start1 + common_prefix_length] >= num[start2 + common_prefix_length]
  end

  num_length = num.size

  # Pre-compute the longest common prefix (LCP) array.
  longest_common_prefix = (0..num_length).map { [0] * (num_length + 1) }
  (num_length - 1).downto(0).each do |i|
    (num_length - 1).downto(0).each do |j|
      longest_common_prefix[i][j] = 1 + longest_common_prefix[i + 1][j + 1] if num[i] == num[j]
    end
  end

  # Dynamic programming table where dp[i][j] represents the number of combinations
  # of valid integers with length 'j' that end at index 'i - 1'.
  dp = (0..num_length).map { [0] * (num_length + 1) }
  dp[0][0] = 1

  # Build up the DP table.
  (1..num_length).each do |i|
    (1..i).each do |j|
      current_value = 0
      if num[i - j] != '0'  # Skip numbers with leading zero.
        if i - j - j >= 0 && is_greater_or_equal(i - j, i - j - j, j, num, longest_common_prefix)
          # The substring is greater or equal to the previous,
          # so we can safely append to the previous.
          current_value = dp[i - j][j]
        else
          # Take the combination counts from the smaller number if present.
          current_value = dp[i - j][[j - 1, i - j].min]
        end
      end
      # Update the current dp value including the current value with MOD.
      # Accumulate with the previous j-1 combinations.
      dp[i][j] = (dp[i][j - 1] + current_value) % MOD
    end
  end
  dp[num_length][num_length]
end

p number_of_combinations("327")
# Output: 2
p number_of_combinations("094")
# Output: 0
p number_of_combinations("0")
# Output: 0
p number_of_combinations("1122")
# Output: 5
p number_of_combinations("11022")
# Output: 3
p number_of_combinations("113224345345672356")
# Output: 180
p number_of_combinations("1132243453456723562456731925")
# Output: 1215
p number_of_combinations("113224345345672356245673192583113224345345672356245673192583113224345345672356245673192583113224345345672356245673192583113224345345672356245673192583113224345345672356245673192583113224345345672356245673192583")
# Output: 156786812
