# frozen_string_literal: true

require "minitest/autorun"
%w[
  ../collect_all_apples_in_tree
  ../single_number
  ../top_k_frequent_words
].each { require_relative _1 }

class FullTest < Minitest::Test
  def test_the_top_k_frequent_words
    assert_equal ["i","love"], top_k_frequent_words(["i","love","leetcode","i","love","coding"], 2)
    assert_equal ["the","is","sunny","day"], top_k_frequent_words(["the","day","is","sunny","the","the","the","sunny","is","is"], 4)
    assert_equal ["is", "the"], top_k_frequent_words(["the","the","the","day","sunny","sunny","is","is","is"], 2)
    assert_equal ["is", "the", "sunny", "day"], top_k_frequent_words(["the","the","the","day","sunny","sunny","is","is","is"], 6)
  end

  def test_the_top_k_frequent_words_ii
    assert_equal ["i","love"], top_k_frequent_words_ii(["i","love","leetcode","i","love","coding"], 2)
    assert_equal ["the","is","sunny","day"], top_k_frequent_words_ii(["the","day","is","sunny","the","the","the","sunny","is","is"], 4)
    assert_equal ["is", "the"], top_k_frequent_words_ii(["the","the","the","day","sunny","sunny","is","is","is"], 2)
    assert_equal ["is", "the", "sunny", "day"], top_k_frequent_words_ii(["the","the","the","day","sunny","sunny","is","is","is"], 6)
  end

  def test_the_top_k_frequent_elements
    assert_equal [1,2], top_k_frequent_elements([1,1,1,2,2,3], 2)
    assert_equal [1], top_k_frequent_elements([1], 1)
    assert_equal [10, 11], top_k_frequent_elements([10,11,13,25,22,30,42,10], 2)
    assert_equal [10, 11, 13], top_k_frequent_elements([10,11,13,25,22,30,42,10], 3)
    assert_equal [10, 11, 13, 22, 25, 30, 42], top_k_frequent_elements([10,11,13,25,22,30,42,10], 0)
    assert_equal [10, 11], top_k_frequent_elements([10,11,13,25,22,30,42,10], -2)
    assert_equal [0, 1], top_k_frequent_elements([1,1,1,2,2,3,0,0,0,5,5,5], 2)
    assert_equal [0, 1], top_k_frequent_elements([1,1,1,2,2,3,5,5,5,0,0,0], 2)
  end

  def test_the_top_k_frequent_elements_ii
    assert_equal [1,2], top_k_frequent_elements_ii([1,1,1,2,2,3], 2)
    assert_equal [1], top_k_frequent_elements_ii([1], 1)
    assert_equal [10, 11], top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], 2)
    assert_equal [10, 11, 13], top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], 3)
    assert_equal [10, 11, 13, 22, 25, 30, 42], top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], 0)
    assert_equal [10, 11], top_k_frequent_elements_ii([10,11,13,25,22,30,42,10], -2)
    assert_equal [0, 1], top_k_frequent_elements_ii([1,1,1,2,2,3,0,0,0,5,5,5], 2)
    assert_equal [0, 1], top_k_frequent_elements_ii([1,1,1,2,2,3,5,5,5,0,0,0], 2)
  end

  def test_the_single_number
    assert_equal 1, single_number([2,2,1,1,1])
    assert_equal 1, single_number([2,2,1])
    assert_equal 4, single_number([4,1,2,1,2])
    assert_equal 1, single_number([1])
  end

  def test_the_single_number_ii
    assert_equal 3, single_number_ii([2,2,3,2])
    assert_equal 99, single_number_ii([0,1,0,1,0,1,99])
    assert_equal 0, single_number_ii([0,1,0,1,0,1])
  end

  def test_the_collect_all_apples_in_tree
    assert_equal 8, min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,true,false,true,true,false])
    assert_equal 6, min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,true,false,false,true,false])
    assert_equal 0, min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,false,false,false,false,false])
    assert_equal 0, min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[true,false,false,false,false,false,false])
    assert_equal 6, min_time(9,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6],[4,7],[4,8]],[false,false,false,false,false,false,false,false,true])
    assert_equal 6, min_time(9,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6],[4,7],[4,8]],[false,true,false,false,true,false,false,false,true])
  end
end
