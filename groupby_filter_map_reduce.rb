# https://leetcode.com/problems/group-by/description/
# 2631. Group By

# Please solve it without Enumerable.group_by method.
# https://ruby-doc.org/3.3.0/Enumerable.html#method-i-group_by
# Look at https://docs.ruby-lang.org/en/master/Proc.html

# Example 1:
# Input: 
# array = [
#   {"id":"1"},
#   {"id":"1"},
#   {"id":"2"}
# ], 
# fn = function (item) { 
#   return item.id; 
# }
# Output: 
# { 
#   "1": [{"id": "1"}, {"id": "1"}],   
#   "2": [{"id": "2"}] 
# }
# Explanation:
# Output is from array.groupBy(fn).
# The selector function gets the "id" out of each item in the array.
# There are two objects with an "id" of 1. Both of those objects are put in the first array.
# There is one object with an "id" of 2. That object is put in the second array.

# Example 2:
# Input: 
# array = [
#   [1, 2, 3],
#   [1, 3, 5],
#   [1, 5, 9]
# ]
# fn = function (list) { 
#   return String(list[0]); 
# }
# Output: 
# { 
#   "1": [[1, 2, 3], [1, 3, 5], [1, 5, 9]] 
# }
# Explanation:
# The array can be of any type. In this case, the selector function defines the key as being the first element in the array. 
# All the arrays have 1 as their first element so they are grouped together.
# {
#   "1": [[1, 2, 3], [1, 3, 5], [1, 5, 9]]
# }

# Example 3:
# Input: 
# array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# fn = function (n) { 
#   return String(n > 5);
# }
# Output:
# {
#   "true": [6, 7, 8, 9, 10],
#   "false": [1, 2, 3, 4, 5]
# }
# Explanation:
# The selector function splits the array by whether each number is greater than 5.

# /**
#  * @param {Function} fn
#  * @return {Object}
#  */
# Array.prototype.groupBy = function(fn) {
    
# };

class Array
# module Enumerable
  # @param {lambda} fn
  # @return {Hash}
  # def group_by(&fn)
  #   return {} unless block_given?

  #   each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |elem, res|
  #     res[fn.call(elem)] << elem
  #   end
  # end
  def group_by
    return {} unless block_given?

    each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |elem, res|
      res[yield(elem)] << elem
    end
  end
end

puts "Group By"
pp [
  {"id":"1"},
  {"id":"1"},
  {"id":"2"}
].group_by(&-> (item) { item[:id].to_s } )
# Output: 
# {"1"=>[{:id=>"1"}, {:id=>"1"}], "2"=>[{:id=>"2"}]}
pp [
  {"id" => "1"},
  {"id" => "1"},
  {"id" => "2"}
].group_by(&-> (item) { item["id"].to_s } )
# Output: 
# { 
#   "1" => [{"id" => "1"}, {"id" => "1"}],   
#   "2" => [{"id" => "2"}] 
# }
pp [
  [1, 2, 3],
  [1, 3, 5],
  [1, 5, 9]
].group_by { |list| list[0].to_s }
# Output: 
# { 
#   "1" => [[1, 2, 3], [1, 3, 5], [1, 5, 9]] 
# }
pp [
  [1, 2, 3],
  [1, 3, 5],
  [1, 5, 9]
].group_by(&-> (list) { list[0].to_s } )
# Output: 
# { 
#   "1" => [[1, 2, 3], [1, 3, 5], [1, 5, 9]] 
# }
pp [
  [1, 2, 3],
  [1, 3, 5],
  [1, 5, 9]
].group_by
# Output: 
# {}
pp [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].group_by(&-> (n) { (n > 5).to_s } )
# Output:
# {
#   "false" => [1, 2, 3, 4, 5],
#   "true" => [6, 7, 8, 9, 10]
# }


#######################
# https://leetcode.com/problems/filter-elements-from-array/description/
# 2634. Filter Elements from Array

# Please solve it without .filter method.
# https://ruby-doc.org/3.3.0/Enumerable.html#method-i-filter
# https://ruby-doc.org/3.3.0/Array.html#method-i-select
# https://ruby-doc.org/3.3.0/Array.html#method-i-filter
# https://ruby-doc.org/3.3.0/Hash.html#method-i-filter
# Look at https://docs.ruby-lang.org/en/master/Proc.html

# Example 1:
# Input: arr = [0,10,20,30], fn = function greaterThan10(n) { return n > 10; }
# Output: [20,30]
# Explanation:
# const newArray = filter(arr, fn); // [20, 30]
# The function filters out values that are not greater than 10

# Example 2:
# Input: arr = [1,2,3], fn = function firstIndex(n, i) { return i === 0; }
# Output: [1]
# Explanation:
# fn can also accept the index of each element
# In this case, the function removes elements not at index 0

# Example 3:
# Input: arr = [-2,-1,0,1,2], fn = function plusOne(n) { return n + 1 }
# Output: [-2,0,1,2]
# Explanation:
# Falsey values such as 0 should be filtered out

class Array
# module Enumerable
  # @param {Proc} fn
  # @return {Array}
  # def filter(&fn)
  #   return [] unless block_given?

  #   each_with_object([]).with_index do |(elem, res), i|
  #     res << elem if fn.call(elem, i)
  #   end
  # end
  def filter
    return [] unless block_given?

    each_with_object([]).with_index do |(elem, res), i|
      res << elem if yield(elem, i)
    end
  end
end

puts "Filter Elements from Array"
pp [0,10,20,30].filter
# Output:
# []
# pp [0,10,20,30].filter(&-> (n) { |n| n > 5 } )
# returns an error (ArgumentError):
# "wrong number of arguments (given 2, expected 1)"
pp [0,10,20,30].filter(&Proc.new{ |n| n > 5 } )
# Output:
# [20,30]
pp [0,10,20,30].filter { |n| n > 5 }
# Output:
# [20,30]
pp [1,2,3].filter(&Proc.new{ |n, i| i == 0 } )
# Output:
# [1]
pp [-2,-1,0,1,2].filter(&Proc.new{ |n| n + 1 != 0 } )
# Output:
# [-2,0,1,2]


#######################
# https://leetcode.com/problems/apply-transform-over-each-element-in-array/description/
# 2635. Apply Transform Over Each Element in Array

# Please solve it without .map method.
# https://ruby-doc.org/3.3.0/Array.html#method-i-map
# https://ruby-doc.org/3.3.0/Enumerable.html#method-i-map
# Look at https://docs.ruby-lang.org/en/master/Proc.html

# Example 1:
# Input: arr = [1,2,3], fn = function plusone(n) { return n + 1; }
# Output: [2,3,4]
# Explanation:
# const newArray = map(arr, plusone); // [2,3,4]
# The function increases each value in the array by one.

# Example 2:
# Input: arr = [1,2,3], fn = function plusI(n, i) { return n + i; }
# Output: [1,3,5]
# Explanation: The function increases each value by the index it resides in.

# Example 3:
# Input: arr = [10,20,30], fn = function constant() { return 42; }
# Output: [42,42,42]
# Explanation: The function always returns 42.

class Array
# module Enumerable
  # @param {Proc} fn
  # @return {Array}
  # def map(&fn)
  #   return [] unless block_given?

  #   each_with_object([]).with_index do |(elem, res), i|
  #     res << fn.call(elem, i)
  #   end
  # end
  def map
    return [] unless block_given?

    each_with_object([]).with_index do |(elem, res), i|
      res << yield(elem, i)
    end
  end
end

puts "Apply Transform Over Each Element in Array"
pp [1,2,3].map
# Output:
# []
pp [1,2,3].map(&Proc.new{ |n| n + 1 } )
# Output:
# [2,3,4]
pp [1,2,3].map(&Proc.new{ |n, i| n + i } )
# Output:
# [1,3,5]
pp [1,2,3].map(&Proc.new{ 42 } )
# Output:
# [42,42,42]


#######################
# https://leetcode.com/problems/array-reduce-transformation/description/
# 2626. Array Reduce Transformation

# Please solve it without Enumerable.reduce, Enumerable.inject, Enumerable.each_with_object methods.
# https://ruby-doc.org/3.3.0/Enumerable.html#method-i-reduce
# https://ruby-doc.org/3.3.0/Enumerable.html#method-i-inject
# https://ruby-doc.org/3.3.0/Enumerable.html#method-i-each_with_object
# Look at https://docs.ruby-lang.org/en/master/Proc.html

# Example 1:
# Input:
# nums = [1,2,3,4]
# fn = function sum(accum, curr) { return accum + curr; }
# init = 0
# Output: 10
# Explanation:
# initially, the value is init=0.
# (0) + nums[0] = 1
# (1) + nums[1] = 3
# (3) + nums[2] = 6
# (6) + nums[3] = 10
# The final answer is 10.

# Example 2:
# Input:
# nums = [1,2,3,4]
# fn = function sum(accum, curr) { return accum + curr * curr; }
# init = 100
# Output: 130
# Explanation:
# initially, the value is init=100.
# (100) + nums[0] * nums[0] = 101
# (101) + nums[1] * nums[1] = 105
# (105) + nums[2] * nums[2] = 114
# (114) + nums[3] * nums[3] = 130
# The final answer is 130.

# Example 3:
# Input:
# nums = []
# fn = function sum(accum, curr) { return 0; }
# init = 25
# Output: 25
# Explanation: For empty arrays, the answer is always init.

class Array
# module Enumerable
  # @param {Proc} fn
  # @return {Array}
  # def reduce(init = 0, &fn)
  #   return init unless block_given?

  #   accum = init
  #   each { |elem| accum = fn.call(accum, elem) }
  #   accum
  # end
  def reduce(init = 0)
    return init unless block_given?

    accum = init
    each { |elem| accum = yield(accum, elem) }
    accum
  end
end

puts "Array Reduce Transformation"
pp [1,2,3,4].reduce(20)
# Output:
# 20
pp [1,2,3,4].reduce(0, &Proc.new{ |accum, n| accum + n })
# Output:
# 10
pp [1,2,3,4].reduce(0) { |accum, n| accum + n }
# Output:
# 10
pp [1,2,3,4].reduce(0, &-> (accum, n) { accum + n })
# Output:
# 10
pp [1,2,3,4].reduce(100, &-> (accum, n) { accum + n * n })
# Output:
# 130
pp [].reduce(25, &-> (accum, n) { 0 })
# Output:
# 25
pp [1,2].reduce(25, &-> (accum, n) { 0 })
# Output:
# 0
pp [1,2].reduce(25, &-> (accum, n) { n })
# Output:
# 2
