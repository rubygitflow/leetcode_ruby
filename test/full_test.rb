# frozen_string_literal: true
# https://github.com/minitest/minitest

require "minitest/autorun"
%w[
  ../collect_all_apples_in_tree
  ../single_number
  ../top_k_frequent_words
  ../delete_characters_to_make_fancy_string
  ../count_number_of_special_subsequences
  ../check_if_move_is_legal
  ../minimum_time_to_type_word_using_special_typewriter
  ../maximum_matrix_sum
  ../merging_k_sorted_lists
  ../advantage_shuffle
  ../alternating_digit_sum
  ../best_time_to_buy_and_sell_stock
].each { require_relative _1 }

class FullTest < Minitest::Test
  def test_the_best_time_to_buy_and_sell_stock
    assert_equal max_profit([7,1,5,3,6,4]), 5
    assert_equal max_profit([7,6,4,3,1]), 0
  end

  def test_the_best_time_to_buy_and_sell_stock_ii
    assert_equal max_profit_ii([7,1,5,3,6,4]), 7
    assert_equal max_profit_ii([1,2,3,4,5]), 4
    assert_equal max_profit_ii([7,6,4,3,1]), 0
    assert_equal max_profit_ii([7]), 0
    assert_equal max_profit_ii([]), 0
  end

  def test_the_best_time_to_buy_and_sell_stock_ii_ex
    skip "Ruby-case only"
    assert_equal max_profit_ii_ex([7,1,5,3,6,4]), 7
    assert_equal max_profit_ii_ex([1,2,3,4,5]), 4
    assert_equal max_profit_ii_ex([7,6,4,3,1]), 0
    assert_equal max_profit_ii_ex([7]), 0
    assert_equal max_profit_ii_ex([]), 0
  end

  def test_the_best_time_to_buy_and_sell_stock_iii
    assert_equal max_profit_iii([3,3,5,0,0,3,1,4]), 6
    assert_equal max_profit_iii([1,2,3,4,5]), 4
    assert_equal max_profit_iii([7,6,4,3,1]), 0
    assert_equal max_profit_iii([7]), 0
    assert_equal max_profit_iii([]), 0
  end

  def test_the_best_time_to_buy_and_sell_stock_iv
    assert_equal max_profit_iv(2, [2,4,1]), 2
    assert_equal max_profit_iv(2, [3,2,6,7,5,0,3]), 8
    assert_equal max_profit_iv(2, [3,2,6,5,0,3]), 7
  end

  def test_the_best_time_to_buy_and_sell_stock_with_hold
    assert_equal max_profit_with_hold([1,2,3,0,2]), 3
    assert_equal max_profit_with_hold([1]), 0
  end

  def test_the_best_time_to_buy_and_sell_stock_after_fee
    assert_equal max_profit_after_fee([1,3,2,8,4,9], 2), 8
    assert_equal max_profit_after_fee([1,3,7,5,10,3], 3), 6
    assert_equal max_profit_after_fee([8,9,7,6,8,8], 2), 0
  end


  def test_the_add_digits
    assert_equal add_digits(38), 2
    assert_equal add_digits(0), 0
    assert_equal add_digits(886995), 9
    assert_equal add_digits(1), 1
  end

  def test_the_alternating_digit_sum
    assert_equal alternate_digit_sum(521), 4
    assert_equal alternate_digit_sum(111), 1
    assert_equal alternate_digit_sum(886996), 0
    assert_equal alternate_digit_sum(885996), -1
    assert_equal alternate_digit_sum(886995), 1
  end


  def test_the_advantage_shuffle
    assert_equal advantage_count([2,7,11,15], [1,10,4,11]), [2,11,7,15]
    assert_equal advantage_count([12,24,8,32], [13,25,32,11]), [24,32,8,12]
    assert_equal advantage_count([12,24,8], [13,25,32,11]), []
  end


  def test_the_merging_k_sorted_lists
    skip "Ruby-task only"
    assert_equal merge_k_lists([[1,4,5],[1,3,4],[2,6]]).to_a, [1,1,2,3,4,4,5,6]
    assert_equal merge_k_lists([]).to_a, []
    assert_equal merge_k_lists([[]]).to_a, []
    assert_equal merge_k_lists([[11,14,15],[21,23,24],[2,6]]).to_a, [2,6,11,14,15,21,23,24]
  end


  def test_the_maximum_matrix_sum_forloop
    assert_equal max_matrix_sum([[1,-1],[-1,1]]), 4
    assert_equal max_matrix_sum([[1,2,3],[-1,-2,-3],[1,2,3]]), 16
  end

  def test_the_maximum_matrix_sum_reduce
    skip "Ruby-case only"
    assert_equal max_matrix_sum_ii([[1,-1],[-1,1]]), 4
    assert_equal max_matrix_sum_ii([[1,2,3],[-1,-2,-3],[1,2,3]]), 16
  end

  def test_the_maximum_matrix_sum_each_with_object
    skip "Ruby-case only"
    assert_equal max_matrix_sum_iii([[1,-1],[-1,1]]), 4
    assert_equal max_matrix_sum_iii([[1,2,3],[-1,-2,-3],[1,2,3]]), 16
  end


  def test_the_minimum_time_to_type_word_using_special_typewriter
    assert_equal min_time_to_type("abc"), 5
    assert_equal min_time_to_type("bza"), 7
    assert_equal min_time_to_type("zjpc"), 34
  end


  def test_the_check_if_move_is_legal
    board, r_move, c_move, color = [[".",".",".","B",".",".",".","."],[".",".",".","W",".",".",".","."],[".",".",".","W",".",".",".","."],[".",".",".","W",".",".",".","."],["W","B","B",".","W","W","W","B"],[".",".",".","B",".",".",".","."],[".",".",".","B",".",".",".","."],[".",".",".","W",".",".",".","."]], 4, 3, "B"
    assert_equal check_move(board, r_move, c_move, color), true
    board, r_move, c_move, color = [[".",".",".",".",".",".",".","."],[".","B",".",".","W",".",".","."],[".",".","W",".",".",".",".","."],[".",".",".","W","B",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".","B","W",".","."],[".",".",".",".",".",".","W","."],[".",".",".",".",".",".",".","B"]], 4, 4, "W"
    assert_equal check_move(board, r_move, c_move, color), false
  end


  def test_the_count_number_of_special_subsequences
    assert_equal count_special_subsequences([0,1,2]), 1
    assert_equal count_special_subsequences([0,1,2,0]), 1
    assert_equal count_special_subsequences([0,1,2,2]), 3
    assert_equal count_special_subsequences([2,2,0,0]), 0
    assert_equal count_special_subsequences([0,1,2,0,1,2]), 7
  end


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


  def test_the_top_k_frequent_words
    skip "Ruby-case only"
    assert_equal top_k_frequent_words(["i","love","leetcode","i","love","coding"], 2), ["i","love"]
    assert_equal top_k_frequent_words(["the","day","is","sunny","the","the","the","sunny","is","is"], 4), ["the","is","sunny","day"]
    assert_equal top_k_frequent_words(["the","the","the","day","sunny","sunny","is","is","is"], 2), ["is", "the"]
    assert_equal top_k_frequent_words(["the","the","the","day","sunny","sunny","is","is","is"], 6), ["is", "the", "sunny", "day"]
  end

  def test_the_top_k_frequent_words_ii
    assert_equal top_k_frequent_words_ii(["i","love","leetcode","i","love","coding"], 2), ["i","love"]
    assert_equal top_k_frequent_words_ii(["the","day","is","sunny","the","the","the","sunny","is","is"], 4), ["the","is","sunny","day"]
    assert_equal top_k_frequent_words_ii(["the","the","the","day","sunny","sunny","is","is","is"], 2), ["is", "the"]
    assert_equal top_k_frequent_words_ii(["the","the","the","day","sunny","sunny","is","is","is"], 6), ["is", "the", "sunny", "day"]
  end

  def test_the_top_k_frequent_elements
    skip "Ruby-case only"
    assert_equal top_k_frequent_elements([1,1,1,2,2,3], 2), [1,2]
    assert_equal top_k_frequent_elements([1], 1), [1]
    assert_equal top_k_frequent_elements([10,11,13,25,22,30,42,10], 2), [10, 11]
    assert_equal top_k_frequent_elements([10,11,13,25,22,30,42,10], 3), [10, 11, 13]
    assert_equal top_k_frequent_elements([10,11,13,25,22,30,42,10], 0), [10, 11, 13, 22, 25, 30, 42]
    assert_equal top_k_frequent_elements([10,11,13,25,22,30,42,10], -2), [10, 11]
    assert_equal top_k_frequent_elements([1,1,1,2,2,3,0,0,0,5,5,5], 2), [0, 1]
    assert_equal top_k_frequent_elements([1,1,1,2,2,3,5,5,5,0,0,0], 2), [0, 1]
  end

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
