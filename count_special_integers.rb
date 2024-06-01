# https://leetcode.com/problems/count-special-integers/description/
# 2376. Count Special Integers
# Explanation: https://algo.monster/liteproblems/2376

# @param {Integer} n
# @return {Integer}
def count_special_numbers(n)
  # Recursive function to calculate permutations A(m, n) = m! / (m-n)!
  def permutations(m, n)
    n == 0 ? 1 : permutations(m, n - 1) * (m - n + 1)
  end

  # List to keep track of visited digits
  visited = [false] * 10
  # Convert the number into a list of its digits in reverse order
  # so we can process the least significant digit first
  digits = n.digits
  # Length of the number (number of digits)
  num_length = digits.size

  # Variable to store the count of special numbers
  # Count all special numbers with length less than the length of n
  res = (1...num_length).reduce(0) { _1 + 9 * permutations(9, _2 - 1) }

  # Count special numbers with the same length as n  
  (0...num_length).reverse_each do |i|
    current_digit = digits[i]
    # First digit cannot be 0, others can
    start = i == num_length - 1 ? 1 : 0
    while start < current_digit
      res += permutations(10 - (num_length - i), i) unless visited[start]
      start += 1
    end
    # If the current digit has already been visited, stop the loop
    break if visited[current_digit]
          
    # Mark the digit as visited
    visited[current_digit] = true
    # If we're at the last digit and haven't broken the loop,
    # then we need to account for this number itself being a special number
    res += 1 if i == 0
  end

  res
end

p count_special_numbers(5)
# Output: 5
p count_special_numbers(20)
# Output: 19
p count_special_numbers(135)
# Output: 110
p count_special_numbers(320)
# Output: 251
p count_special_numbers(2 * 10 ** 9)
# Output: 5974650
