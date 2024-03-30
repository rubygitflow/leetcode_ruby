# https://leetcode.com/problems/maximum-binary-string-after-change/description/
# 1702. Maximum Binary String After Change

# You can apply each of the following operations any number of times:
# Operation 1: If the number contains the substring "00", you can replace it with "10".
# For example, "00010" -> "10010"
# Operation 2: If the number contains the substring "10", you can replace it with "01".
# For example, "00010" -> "00001"

# @param {String} binary
# @return {String}
def maximum_binary_string(binary)
  c_first_ones,l = 0, binary.size
  while c_first_ones<l && binary[c_first_ones]=='1' do c_first_ones+=1 end
  c_zeros = binary.count('0')
  # The solution formula
  '1'*c_first_ones+'1'*(c_zeros>0 ? c_zeros-1 : 0)+'0'*(c_zeros>0 ? 1 : 0)+'1'*(l-c_first_ones-c_zeros)
end

p maximum_binary_string("000110")
# Output: "111011"
p maximum_binary_string("01")
# Output: "01"
p maximum_binary_string("1101011")
# Output: "1110111"
p maximum_binary_string("0000")
# Output: "1110"
p maximum_binary_string("1111")
# Output: "1111"
