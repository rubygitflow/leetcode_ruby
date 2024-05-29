# How to transform a hash/dictionary/map

# @param {Hash} hash
# @return {Array}
def transform(hash)
  hash.reduce([]) { |res, (k,v)| res << {'name' => k.to_s}.merge(v) }
end

puts "transform a hash/dictionary/map"
pp transform({'first_name' => {'required' => true, 'enabled' => false},
 'last_name' => {'required' => true, 'enabled' => false}})
# Output: [
#   {
#    'name' => 'first_name',
#    'required' => true,
#    'enamble' => false
#   },{
#    'name' => 'last_name',
#    'required' => true,
#    'enamble' => false
#   }
# ]

# How to shorten a hash/dictionary/map
# @param {Array} arr
# @return {Hash}
def shorten(arr)
  arr.reduce({}) { |res, hash| res.merge({hash.delete('name') => hash}) if hash.key?('name') }
end

puts "shorten a hash/dictionary/map"
pp shorten([
  {
   'name' => 'first_name',
   'required' => true,
   'enamble' => false
  },{
   'name' => 'last_name',
   'required' => true,
   'enamble' => false
  }
])
# Output: {'first_name' => {'required' => true, 'enabled' => false},
# 'last_name' => {'required' => true, 'enabled' => false}}
