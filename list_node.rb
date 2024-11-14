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

  def to_a
    out = []
    return out unless @val
    out << @val
    node = @next
    while node
      out << node.val
      node = node.next
    end
    out
  end
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
