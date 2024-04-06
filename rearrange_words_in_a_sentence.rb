# https://leetcode.com/problems/rearrange-words-in-a-sentence/description/
# 1451. Rearrange Words in a Sentence

# @param {String} text
# @return {String}
def arrange_words(text)
   text.split.sort_by{|word| word.length}.join(" ").capitalize
end

p arrange_words("Leetcode is cool")
# Output: "Is cool leetcode"
p arrange_words("Keep calm and code on")
# Output: "On and keep calm code"
p arrange_words("To be or not to be")
# Output: "To be or to be not"


