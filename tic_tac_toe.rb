# tic-tac-toe
# implementation strategy
# 1. Create Board
# 2. Display Board
# 3. Add function to
# 2. Log win conditions
# 3. Create way to add
#
# Pseudo Code:
# Start Game
# player_turn is x
# game playing?
#   player turn
#   check win condition from last move
#     Check Horizontal
#     Check Vertical
#     Check Diagonal
#       Main Diagonal
#       Anti Diagonal
#     Next Player turn
# Print -- Outcome
BOARD_DIM = 3

class Board
  attr_accessor :board,:game_playing

  def initialize()
    @board = Array.new(BOARD_DIM) {[" "," "," "]}
    @game_playing = true
  end

  def valid_move?(move)
    ( move > 0 &&
      move <= BOARD_DIM * BOARD_DIM &&
      self.board[(move-1) / (BOARD_DIM)][(move-1)%BOARD_DIM]==" ")
  end


  def check_draw()
    return self.board.flatten.none?(" ")
  end

  def check_win(player)
    win = false
    if check_horizontal_win(player)
      win = true
    elsif check_vertical_win(player)
      win= true
    elsif check_diagonal_win(player)
      win = true
    elsif check_antidiagonal_win(player)
      win = true
    end
    return win
  end

  def check_horizontal_win(player)
    self.board.any? {|x| x.all? {|item| item == player}}
  end

  def check_vertical_win(player)
    for i in 0..(self.board.length-1)
      if  (self.board.all? {|x| x[i]==player} )
         return true
      end
    end
    return false
  end

  def check_diagonal_win(player)
    win = true
    self.board.each_with_index do |x,i|
      # p "i = #{i}"
      # p "x = #{x}"
      if x[i]!=player
        win = false
      end
    end
    return win
  end

  def check_antidiagonal_win(player)
    win = true
    self.board.each_with_index do |x,i|
      if x[BOARD_DIM-i-1] != player
        win = false
      end
    end
    return win
  end

  def show_board()
    counter = 1
    show_board = self.board.map(&:clone)
    show_board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        if cell == " "
          show_board[y][x] = counter.to_s
        end
        counter +=1
      end
    end


    puts " #{show_board[0][0]} | #{show_board[0][1]} | #{show_board[0][2]} "
    puts "---+---+---"
    puts " #{show_board[1][0]} | #{show_board[1][1]} | #{show_board[1][2]} "
    puts "---+---+---"
    puts " #{show_board[2][0]} | #{show_board[2][1]} | #{show_board[2][2]} "
  end

  def get_move(player)
    waiting_for_input = true
    while waiting_for_input do
      puts "#{player}: What is your move?" # Use puts for the prompt
      move = gets.chomp.to_i
      if self.valid_move?(move)
        row = (move-1) / BOARD_DIM
        col = (move-1) % BOARD_DIM
        self.board[row][col] = player # Update the board with the player’s symbol
        waiting_for_input = false # Break the loop
      else
        self.show_board()
        puts "Invalid Move! Please try again"
      end
    end
  end

end

class TicTacToe
  attr_accessor :x_player, :o_player, :player_turn

  def initialize()
    @x_player = "X"
    @o_player = "O"
    @player_turn = @x_player

  end

  def swap_player()
    if self.player_turn == self.x_player
      self.player_turn = self.o_player
    else self.player_turn = self.x_player
    end
  end

  def play_game()
    playing = true
    game_board = Board.new
    while playing
      game_board.show_board
      game_board.get_move(self.player_turn)
      if game_board.check_win(self.player_turn)
        puts "Wow! #{self.player_turn} wins!"
        playing = false

      elsif game_board.check_draw()
        puts "Oh No! It's a draw!"
        playing = false
      end
      self.swap_player()
    end
    game_board.show_board
  end

end

new_game = TicTacToe.new
new_game.play_game
