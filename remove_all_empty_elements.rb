# Remove all empty elements '', '-', 'N/A' from a hash/dictionary/map

# @param {Hash} hash
# @return {Hash}
def clean(hash)
  cleaner(hash)
end

def cleaned?(elem)
  (elem.is_a?(Enumerable) && elem&.empty?) || 
  elem.nil? ||
  ['', '-', 'N/A'].include?(elem)
end

def cleaner(obj)
  out = if obj.is_a?(Hash)
          obj.delete_if {|k, v| cleaned?(cleaner(v))}
          obj
        elsif obj.is_a?(Array)
          obj.delete_if {|elem| cleaned?(cleaner(elem)) }
          obj
        else
          cleaned?(obj) ? nil : obj
        end
  out
end

pp clean({data: {a: {x: 'Text1', y: 'Text2', z: ['Text3', 3, {v: nil, w: 'Text6'}, '-']}, b: 'N/A', c: {k: {u: '-'}, l: 'Text4'}}, date: '', d: ["Text5", 5, "-"]})
# Output: {data: {a: {x: 'Text1', y: 'Text2', z: ['Text3', 3, {w: 'Text6'}]}, c: {l: 'Text4'}}, d: ["Text5", 5]}
