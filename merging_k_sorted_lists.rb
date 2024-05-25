# https://leetcode.com/problems/merge-k-sorted-lists/description/
# 23. Merge k Sorted Lists

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
require_relative 'list_node'

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  lst = lists.map do |list|
    add_linked_list(list)
  end
  return [] if lst.size.zero?

  lst
end

p merge_k_lists([[1,4,5],[1,3,4],[2,6]])
# Output: [1,1,2,3,4,4,5,6]
p merge_k_lists([])
# Output: []
p merge_k_lists([[]])
# Output: []
