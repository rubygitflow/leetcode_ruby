# https://leetcode.com/problems/add-two-numbers/description/
# 2. Add Two Numbers

# Definition for singly-linked list.
# https://dev.to/mwong068/introduction-to-linked-lists-in-ruby-kgi
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def to_s
    s = '['
    s += @val.to_s
    node = @next
    while node
      s += ','
      s += node.val.to_s
      node = node.next
    end
    s += "]"
  end
end

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

# creation a linked list from data with closure at pos
def add_linked_list(data, pos = -1)
  tail = []
  tail = data.each_with_object([]) do |el, acc|
    acc << ListNode.new(el)
  end
  (0..data.size - 1).each do |i|
    tail[i].next = tail[i+1]
  end
  tail[data.size - 1].next = tail[pos] if pos >= 0
  tail[0]
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
