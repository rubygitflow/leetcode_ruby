# frozen_string_literal: true

require "minitest/autorun"
require_relative "../collect_all_apples_in_tree" 

class FullTest < Minitest::Test
  def test_the_collect_all_apples_in_tree
    assert_equal 8, min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,true,false,true,true,false])
    assert_equal 6, min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,true,false,false,true,false])
    assert_equal 0, min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[false,false,false,false,false,false,false])
    assert_equal 0, min_time(7,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],[true,false,false,false,false,false,false])
    assert_equal 6, min_time(9,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6],[4,7],[4,8]],[false,false,false,false,false,false,false,false,true])
    assert_equal 6, min_time(9,[[0,1],[0,2],[1,4],[1,5],[2,3],[2,6],[4,7],[4,8]],[false,true,false,false,true,false,false,false,true])
  end
end
