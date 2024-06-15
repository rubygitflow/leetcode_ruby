# https://leetcode.com/problems/count-primes/description/
# 204. Count Primes
# Explanation: https://algo.monster/liteproblems/204
# the Sieve of Eratosthenes algorithm

# require 'prime'

# def count_primes(n); Prime.each(n - 1).count; end

# @param {Integer} n
# @return {Integer}
def count_primes(n)
  primes = [true] * n
  out = 0
  (2...n).each do |i|
    if primes[i]
      out += 1
      ((i + i)...n).step(i).each { primes[_1] = false }
    end
  end
  out
end

p(count_primes(10))
# Output: 4
p(count_primes(0))
# Output: 0
p(count_primes(1))
# Output: 0
