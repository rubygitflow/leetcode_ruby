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
  # @param {Proc} fn
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
