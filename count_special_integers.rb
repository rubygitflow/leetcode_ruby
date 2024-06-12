# https://leetcode.com/problems/count-special-integers/description/
# 2376. Count Special Integers
# Explanation: https://algo.monster/liteproblems/2376

# @param {Integer} n
# @return {Integer}
def count_special_numbers(n)
  # Permutation function permutations(m, n)
  # that calculates permutations of m elements taken n at a time.
  # Recursive function to calculate permutations: permutations(m, n) = m! / (m-n)!
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

puts "Count Special Integers"
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


#######################
# https://leetcode.com/problems/count-numbers-with-unique-digits-ii/description/
# 3032. Count Numbers With Unique Digits II
# Explanation: https://algo.monster/liteproblems/3032

# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def number_count(a, b)
  count_special_numbers(b) - (a > 1 ? count_special_numbers(a-1) : 0)
end

puts "Count Numbers With Unique Digits II"
p number_count(1, 20)
# Output: 19
p number_count(9, 19)
# Output: 10
p number_count(80, 120)
# Output: 27


#######################
# https://leetcode.com/problems/count-numbers-with-unique-digits/description/
# 357. Count Numbers with Unique Digits
# Explanation: https://algo.monster/liteproblems/357

# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
  # (1...n).reduce(0) { _1 + 9 * permutations(9, _2 - 1) }
  n.times.sum{|x| 9 * (10-x..9).reduce(1,:*) } + 1
end

puts "Count Numbers With Unique Digits"
p count_numbers_with_unique_digits(0)
# Output: 1
p count_numbers_with_unique_digits(1)
# Output: 10
p count_numbers_with_unique_digits(2)
# Output: 91
p count_numbers_with_unique_digits(3)
# Output: 739
p count_numbers_with_unique_digits(4)
# Output: 5275
p count_numbers_with_unique_digits(5)
# Output: 32491
p count_numbers_with_unique_digits(6)
# Output: 168571
p count_numbers_with_unique_digits(7)
# Output: 712891
p count_numbers_with_unique_digits(8)
# Output: 2345851
