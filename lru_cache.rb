# https://leetcode.com/problems/lru-cache/description/
# 146. LRU Cache
# Least Recently Used (LRU) cache

class LRUCache
  # using the feature of Hash where keys are ordered by the time of addition

  attr_reader :cache, :capacity
=begin
  :type capacity: Integer
=end
  def initialize(capacity)
    @cache, @capacity = {}, capacity
  end

=begin
  :type key: Integer
  :rtype: Integer
=end
  def get(key)
    if (v = cache.delete(key)).nil? then
      -1
    else
      @cache.update(key => v)
      v
    end
  end

=begin
  :type key: Integer
  :type value: Integer
  :rtype: Void
=end
  def put(key, value)
    d = @cache.delete(key).nil? ? 1 : 0
    @cache.shift if cache.size + d > capacity
    @cache.update(key => value)
    nil
  end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
obj = LRUCache.new(2)
commands = ["put", "put", "get", "put", "get", "put", "get", "get", "get"]
resources = [[1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
# Output
# [nil, nil, 1, nil, -1, nil, -1, 3, 4]

commands.zip(resources).each do |com, inp| 
  if com == 'put'
    output = obj.put(inp[0],inp[1])
    puts(output.inspect)
  else
    param_2 = obj.get(inp[0])
    puts(param_2.inspect)
  end 
end
