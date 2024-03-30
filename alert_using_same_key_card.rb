# https://leetcode.com/problems/alert-using-same-key-card-three-or-more-times-in-a-one-hour-period/description/
# 1604. Alert Using Same Key-Card Three or More Times in a One Hour Period

# @param {String[]} key_name
# @param {String[]} key_time
# @return {String[]}
def alert_names(key_name, key_time)
  hash = Hash.new { |h,k| h[k] = [] }
  (0...key_name.length).each do |i|
    # convert hours to minutes and subtract minutes
    hour, min = key_time[i].split(':')
    time = hour.to_i * 60 + min.to_i
    hash[key_name[i]] << time
  end

  output = []
  complements = {}
  total_time = 60
  hash.each do |name, times|
    times.sort!
    (0...(times.length - 2)).each do |i|
        time_diff = times[i + 2] - times[i]
        if time_diff <= total_time
            output << name
            break
        end
    end
  end
  output.sort
end

p alert_names(
  ["daniel","daniel","daniel","luis","luis","luis","luis"],
  ["10:00","10:40","11:00","09:00","11:00","13:00","15:00"]
)
# Output: ["daniel"]
p alert_names(
  ["alice","alice","alice","bob","bob","bob","bob"],
  ["12:01","12:00","18:00","21:00","21:20","21:30","23:00"]
)
# Output: ["bob"]
