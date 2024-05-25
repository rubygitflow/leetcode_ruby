# https://leetcode.com/problems/add-two-numbers/description/
# 2. Add Two Numbers

require_relative 'list_node'

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  dummy_head = ListNode.new(0)
  carry, tail = 0, dummy_head
  while l1 || l2 || carry != 0
    sum = carry + (l1&.val || 0) + (l2&.val || 0)
    carry, digit = sum.divmod(10)
    tail.next = ListNode.new(digit)
    tail = tail.next
    l1 =  l1 ? l1.next : nil
    l2 =  l2 ? l2.next : nil
  end
  # remove dummy node from linked list
  result = dummy_head.next
  dummy_head.next = nil
  return result
end

# print the raw of ListNode
# pp add_two_numbers(
#     add_linked_list([2,4,3]),
#     add_linked_list([5,6,4])
# )

puts add_two_numbers(
    add_linked_list([2,4,3]),
    add_linked_list([5,6,4])
).to_s
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.

puts add_two_numbers(
    add_linked_list([0]),
    add_linked_list([0])
).to_s
# Output: [0]

puts add_two_numbers(
    add_linked_list([9,9,9,9,9,9,9]),
    add_linked_list([9,9,9,9])
).to_s
# Output: [8,9,9,9,0,0,0,1]
