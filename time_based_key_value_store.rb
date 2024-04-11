# https://leetcode.com/problems/time-based-key-value-store/
# 981. Time Based Key-Value Store
# Look at binary_search.rb

class TimeMap
  attr_reader :store

  def initialize()
    @store = Hash.new { |h,k| h[k] = [] }
  end

=begin
  :type key: String
  :type value: String
  :type timestamp: Integer
  :rtype: Void
=end
  def set(key, value, timestamp)
    @store[key] << [timestamp, value]
    nil
  end


=begin
  :type key: String
  :type timestamp: Integer
  :rtype: String
=end
  def get(key, timestamp)
    search(key, timestamp)
  end

  private

  def search(key, target)
    bs_sourse = @store[key]
    output = ''
    return output if bs_sourse.empty?

    l , r = 0 , bs_sourse.size - 1
    while l <= r
      mid = (l + r)/2
      if target === bs_sourse[mid][0]
        return bs_sourse[mid][1]
      #left direction
      elsif bs_sourse[mid][0] > target
        r = mid - 1
      #right direction
      else 
        l = mid + 1
        # remember the last known value
        output = bs_sourse[mid][1]
      end
    end
    output
  end
end

# Your TimeMap object will be instantiated and called as such:
obj = TimeMap.new()
# obj.set(key, value, timestamp)
# param_2 = obj.get(key, timestamp)
commands = ["get", "set", "get", "get", "set", "get", "get", "get", "get"]
resources = [["foo", 1], ["foo", "bar", 1], ["foo", 1], ["foo", 3], ["foo", "bar2", 4], ["foo", 4], ["foo", 5], ["foo", 2], ["too", 1]]
# Output
# ["", nil, "bar", "bar", nil, "bar2", "bar2", "bar", ""]
commands.zip(resources).each do |com, inp| 
  if com == 'set'
    output = obj.set(inp[0],inp[1],inp[2])
    puts(output.inspect)
  else
    param_2 = obj.get(inp[0],inp[1])
    puts(param_2.inspect)
  end 
end
