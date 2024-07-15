# frozen_string_literal: true
# https://github.com/minitest/minitest

require "minitest/autorun"
%w[
  ../collect_all_apples_in_tree
  ../single_number
  ../top_k_frequent_words
  ../delete_characters_to_make_fancy_string
].each { require_relative _1 }

class FullTest < Minitest::Test

  def test_the_delete_characters_to_make_fancy_string_forloop
    assert_equal make_fancy_string_ii("leeetcode"), "leetcode"
    assert_equal make_fancy_string_ii("aaabaaaa"), "aabaa"
    assert_equal make_fancy_string_ii("aab"), "aab"
  end

  def test_the_delete_characters_to_make_fancy_string_reduce
    assert_equal make_fancy_string("leeetcode"), "leetcode"
    assert_equal make_fancy_string("aaabaaaa"), "aabaa"
    assert_equal make_fancy_string("aab"), "aab"
  end


  # Ruby-case only
  # def test_the_top_k_frequent_words
  #   assert_equal ["i","love"], top_k_frequent_words(["i","love","leetcode","i","love","coding"], 2)
  #   assert_equal ["the","is","sunny","day"], top_k_frequent_words(["the","day","is","sunny","the","the","the","sunny","is","is"], 4)
  #   assert_equal ["is", "the"], top_k_frequent_words(["the","the","the","day","sunny","sunny","is","is","is"], 2)
  #   assert_equal ["is", "the", "sunny", "day"], top_k_frequent_words(["the","the","the","day","sunny","sunny","is","is","is"], 6)
  # end

  def test_the_top_k_frequent_words_ii
    assert_equal top_k_frequent_words_ii(["i","love","leetcode","i","love","coding"], 2), ["i","love"]
    assert_equal top_k_frequent_words_ii(["the","day","is","sunny","the","the","the","sunny","is","is"], 4), ["the","is","sunny","day"]
    assert_equal top_k_frequent_words_ii(["the","the","the","day","sunny","sunny","is","is","is"], 2), ["is", "the"]
    assert_equal top_k_frequent_words_ii(["the","the","the","day","sunny","sunny","is","is","is"], 6), ["is", "the", "sunny", "day"]
  end

  # Ruby-case only
  # def test_the_top_k_frequent_elements
  #   assert_equal top_k_frequent_elements([1,1,1,2,2,3], 2), [1,2]
  #   assert_equal top_k_frequent_elements([1], 1), [1]
  #   assert_equal top_k_frequent_elements([10,11,13,25,22,30,42,10], 2), [10, 11]
  #   assert_equal top_k_frequent_elements([10,11,13,25,22,30,42,10], 3), [10, 11, 13]
  #   assert_equal top_k_frequent_elements([10,11,13,25,22,30,42,10], 0), [10, 11, 13, 22, 25, 30, 42]
  #   assert_equal top_k_frequent_elements([10,11,13,25,22,30,42,10], -2), [10, 11]
  #   assert_equal top_k_frequent_elements([1,1,1,2,2,3,0,0,0,5,5,5], 2), [0, 1]
  #   assert_equal top_k_frequent_elements([1,1,1,2,2,3,5,5,5,0,0,0], 2), [0, 1]
  # end

  def test_the_top_k_frequent_elements_ii
    assert_equal top_k_frequent_elements_ii([1,1,1,2,2,3], 2), [1,2]
    assert_equal top_k_frequent_elements_ii([1], 1), [1]
    assert_equal top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], 2), [10, 11]
    assert_equal top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], 3), [10, 11, 13]
    assert_equal top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], 0), [10, 11, 13, 22, 25, 30, 42]
    assert_equal top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], -2), [10, 11]
    assert_equal top_k_frequent_elements_ii([1,1,1,2,2,3,0,0,0,5,5,5], 2), [0, 1]
    assert_equal top_k_frequent_elements_ii([1,1,1,2,2,3,5,5,5,0,0,0], 2), [0, 1]
  end


  def test_the_single_number
    assert_equal single_number([2,2,1,1,1]), 1
    assert_equal single_number([2,2,1]), 1
    assert_equal single_number([4,1,2,1,2]), 4
    assert_equal single_number([1]), 1
  end

  def test_the_single_number_ii
    assert_equal single_number_ii([2,2,3,2]), 3
    assert_equal single_number_ii([0,1,0,1,0,1,99]), 99
    assert_equal single_number_ii([0,1,0,1,0,1]), 0
  end


  def test_the_collect_all_apples_in_tree
    assert_equal min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,true,false,true,true,false]), 8
    assert_equal min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,true,false,false,true,false]), 6
    assert_equal min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,false,false,false,false,false]), 0
    assert_equal min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[true,false,false,false,false,false,false]), 0
    assert_equal min_time(9,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6],[4,7],[4,8]],[false,false,false,false,false,false,false,false,true]), 6
    assert_equal min_time(9,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6],[4,7],[4,8]],[false,true,false,false,true,false,false,false,true]), 6
  end
end
