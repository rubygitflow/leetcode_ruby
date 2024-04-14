# https://leetcode.com/problems/triples-with-bitwise-and-equal-to-zero/description/
# 982. Triples with Bitwise AND Equal To Zero

# @return {Integer}
def count_triplets(nums)
  cnt = Hash.new { |h,k| h[k] = 0 }
  for x in nums
    for y in nums
      cnt[x & y] += 1
    end
  end
  output = 0
  for xy, v in cnt
    for z in nums
      output += v if xy & z == 0
    end
  end
  output
end

p count_triplets([2,1,3])
# Output: 12
p count_triplets([0,0,0])
# Output: 27
