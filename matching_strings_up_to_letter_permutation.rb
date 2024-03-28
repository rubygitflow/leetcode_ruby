# Matching strings up to letter permutation
# Дан текст T и строка S. Требуется найти подстроку S' в T такую, что она совпадает с S с точностью до перестановки букв.
# В качестве ответа стоит вернуть индекс первого вхождения, или -1, если такая подстрока S' не нашлась.
# ("reebok", "bee") -> 1

# @param {String} hoststring
# @param {String} substring
# @return {Integer}
def match_substring(hoststring, substring)
  def dfs(where, stack_a)
    where.chars.each { |c|
      if idx = stack_a.index(c)
        stack_a.delete_at(idx)
      else
        return false
      end
    }
    return true
  end

  match_len = substring.length
  host_len = hoststring.length
  return -1 if host_len < match_len

  (0..host_len - match_len).each do |idx|
    return idx if dfs(hoststring[idx,match_len], substring.chars)
  end
  return -1
end

p match_substring('reebokee', 'bee')
# Output: 1
p match_substring('colorados', 'dosar')
# Output: 4
