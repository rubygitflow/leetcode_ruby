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
