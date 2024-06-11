# https://leetcode.com/problems/can-you-eat-your-favorite-candy-on-your-favorite-day/description/
# 1744. Can You Eat Your Favorite Candy on Your Favorite Day?

# @param {Integer[]} candies_count
# @param {Integer[][]} queries
# @return {Boolean[]}
def can_eat(candies_count, queries)
  candies_acc=[0]
  1.upto(candies_count.size) {|i| candies_acc << (candies_acc[-1] + candies_count[i-1])}
  out=[]
  queries.each do |favorite_type, favorite_day, daily_cap|
    first, last = favorite_day, (favorite_day + 1) * daily_cap
    out << (first < candies_acc[favorite_type + 1] && candies_acc[favorite_type] < last)
  end
  out             
end

p can_eat([7,4,5,3,8], [[0,2,2],[4,2,4],[2,13,1000000000]])
# Output: [true,false,true]
p can_eat([5,2,6,4,1], [[3,1,2],[4,10,3],[3,10,100],[4,100,30],[1,3,1]])
# Output: [false,true,true,false,false]
p can_eat([7,4,5,3], [[0, 2, 2], [1, 6, 1], [2, 5, 10]])
# Output: [true, false, true]
