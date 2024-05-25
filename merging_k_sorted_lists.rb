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
  bundle = lists.map do |list|
    add_linked_list(list)
  end
  # create output
  head = ListNode.new(nil)
  return [] if bundle.size.zero?

  # rename output for loop
  tail = head
  # Remove empty list first
  bundle.delete_if { |list| list.nil? }
  while !bundle.empty?
    # Sort bundle from min to max
    bundle.sort_by! { |list| list.val }
    # add next item to output
    tail.next = ListNode.new(bundle[0].val)
    # replace linked-list's item in output
    tail = tail.next
    # move bundle's item
    bundle[0] = bundle[0].next
    # Remove empty list if exists
    bundle.delete_if { |list| list.nil? }
  end

  head.next.nil? ? ListNode.new(nil) : head.next
end

puts merge_k_lists([[1,4,5],[1,3,4],[2,6]]).to_s
# Output: [1,1,2,3,4,4,5,6]
puts merge_k_lists([]).to_s
# Output: []
puts merge_k_lists([[]]).to_s
# Output: []
puts merge_k_lists([[11,14,15],[21,23,24],[2,6]]).to_s
# Output: [2,6,11,14,15,21,23,24]
