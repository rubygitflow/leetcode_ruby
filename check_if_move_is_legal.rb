# https://leetcode.com/problems/check-if-move-is-legal/
# 1958. Check if Move is Legal

# @param {Character[][]} board
# @param {Integer} r_move
# @param {Integer} c_move
# @param {Character} color
# @return {Boolean}
def check_move(board, r_move, c_move, color)
  puts "color: #{color}"
  board.each { p _1 }

  m, n = board.size, board[0].size
  move_direction = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [-1, -1], [1, -1], [-1, 1]]
  for dr, dc in move_direction
    i, j = r_move + dr, c_move + dc
    size = 2
    while i >= 0 && i < m && j >= 0 && j < n
      break if board[i][j] == '.' || size < 3 && board[i][j] == color

      return true if board[i][j] == color

      i += dr
      j += dc
      size += 1
    end
  end
  false
end


board, r_move, c_move, color = [[".",".",".","B",".",".",".","."],[".",".",".","W",".",".",".","."],[".",".",".","W",".",".",".","."],[".",".",".","W",".",".",".","."],["W","B","B",".","W","W","W","B"],[".",".",".","B",".",".",".","."],[".",".",".","B",".",".",".","."],[".",".",".","W",".",".",".","."]], 4, 3, "B"
p(check_move(board, r_move, c_move, color))
# Output: true
board, r_move, c_move, color = [[".",".",".",".",".",".",".","."],[".","B",".",".","W",".",".","."],[".",".","W",".",".",".",".","."],[".",".",".","W","B",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".","B","W",".","."],[".",".",".",".",".",".","W","."],[".",".",".",".",".",".",".","B"]], 4, 4, "W"
p(check_move(board, r_move, c_move, color))
# Output: false
