# frozen_string_literal: true
require 'rspec'
require_relative '../lib/tic_tac_toe.rb'


describe Board do



  describe '#initialize' do
    context 'When a board is created' do
      subject(:test_board) { described_class.new }
      it 'there are 9 empty square' do
        expect(test_board.board).to eq([[" "," "," "],[" "," "," "],[" "," "," "]])
      end
    end
  end


  context 'check win conditions' do

    describe '#check_horizontal_win' do
      subject(:horizontal_win) { described_class.new }
      context 'When there is a winning condition' do

        context 'when a horizontal row is filled with the same symbols' do
          before do
            horizontal_win.board = [["X","X","X"],[" "," "," "],[" "," "," "]]
          end

          it 'is a win condition' do
            expect(horizontal_win.check_horizontal_win('X')).to be(true)
          end
        end

        context 'when a horizontal row is not filled with the same symbols' do

          before do
            horizontal_win.board = [["X","0","X"],[" "," "," "],[" "," "," "]]
          end


          it 'is not a win condition' do
            expect(horizontal_win.check_horizontal_win('X')).not_to be(true)
          end
        end
      end
    end

    describe '#check_vertical_win' do
      subject(:vertical_win) { described_class.new }
      context 'When there is a winning condition' do

        context 'when a vertical row is filled with the same symbols' do
          before do
            vertical_win.board = [["X"," "," "],["X"," "," "],["X"," "," "]]
          end

          it 'is a win condition' do
            expect(vertical_win.check_vertical_win('X')).to be(true)
          end
        end

        context 'when a vertical row is not filled with the same symbols' do

          before do
            vertical_win.board = [["X"," ","X"],["X"," "," "],["O"," "," "]]
          end

          it 'is not a win condition' do
            expect(vertical_win.check_vertical_win('X')).not_to be(true)
          end
        end
      end
    end

    describe '#check_diagonal_win' do
      subject(:diagonal_win) {described_class.new}

      context 'when a diagonal is filled with the same symbols' do
        before do
          diagonal_win.board = [["X"," "," "],[" ","X"," "],[" "," ","X"]]
        end

        it 'is a win condition' do
          expect(diagonal_win.check_diagonal_win('X')).to be(true)
        end

      end

      context 'when a diagonal is not filled with the same symbols' do
        before do
          diagonal_win.board = [["X"," "," "],[" ","O"," "],[" "," ","X"]]
        end

        it 'is a win condition' do
          expect(diagonal_win.check_diagonal_win('X')).not_to be(true)
        end

      end
    end

    describe '#check_antidiagonal_win' do
    subject(:antidiagonal_win) {described_class.new}

      context 'when an antidiagonal is filled with the same symbols' do
        before do
          antidiagonal_win.board = [[""," ","X"],[" ","X"," "],["X"," ","O"]]
        end

        it 'is a win condition' do
          expect(antidiagonal_win.check_antidiagonal_win('X')).to be(true)
        end

      end

      context 'when an antidiagonal is not filled with the same symbols' do
        before do
          antidiagonal_win.board = [["X"," "," "],[" ","O"," "],[" "," ","X"]]
        end

        it 'is a win condition' do
          expect(antidiagonal_win.check_diagonal_win('X')).to be(false)
        end

      end
    end


  end

  describe '#check_draw' do
    subject(:draw_board) {described_class.new}

    context 'when a board is full' do
      before do
        draw_board.board = [["X","O","O"],["O","X","X"],["X","O","O"]]
      end

      it 'is a draw' do
        expect(draw_board.check_draw).to be(true)
      end
    end

    context 'when a board is not full' do
      before do
        draw_board.board = [[" ","O","O"],["O","X","X"],["X","O","O"]]
      end

      it 'is not a draw' do
        expect(draw_board.check_draw).not_to be(true)
      end
    end
  end

  describe '#valid_move?' do

    subject(:move_board) {described_class.new}

    context 'when there is a valid move' do
      before do
        move_board.board = [[" ","O","O"],["O","X","X"],["X","O","O"]]
      end

      it 'returns a valid move' do
        move = 1
        expect(move_board.valid_move?(move)).to be(true)
      end
    end

    context 'when there is an invalid move' do
      before do
        move_board.board = [[" ","O","O"],["O","X","X"],["X","O","O"]]
      end

      it 'returns a valid move' do
        move = 2
        expect(move_board.valid_move?(move)).not_to be(true)
      end
    end

  end

  describe '#show_board' do
    subject(:display_board) {described_class.new}

    it 'calls puts 5 times' do
      expect($stdout).to receive(:puts).exactly(5).times
      display_board.show_board
    end
  end

  describe '#get_move' do
    subject(:display_board) {described_class.new}
    let(:player) {'X'}

    context 'when a valid move is received' do
      before do
        valid_move = '3'

        allow(display_board).to receive(:gets).and_return(valid_move)
        allow(display_board).to receive(:valid_move?).and_return(true)
        allow(display_board).to receive(:place_move)
      end

      it 'sends the move to the board' do
        player = 'X'
        expect(display_board).to receive(:place_move).with(player, 3)
        display_board.get_move(player)
      end
    end

    context 'when an invalid move, then a valid move is received' do
      before do

        allow(display_board).to receive(:gets).and_return('invalid','3')
        allow(display_board).to receive(:valid_move?).and_return(false,true)
        allow(display_board).to receive(:place_move)
        allow(display_board).to receive(:show_board)
      end

      it 'loops through an error the move to the board' do
        prompt_message = "X: What is your move?"
        error_message = "Invalid Move! Please try again"
        expect(display_board).to receive(:puts).with(prompt_message).twice
        expect(display_board).to receive(:puts).with(error_message).once
        expect(display_board).to receive(:place_move).with(player, 3)
        display_board.get_move(player)
      end
    end

  end

  describe '#place_move' do

    subject(:display_board) {described_class.new}
    let(:player) {'X'}

    context 'when place move is called' do
      it 'updates the correct position on the board' do
        expect {display_board.place_move(player,1)}
          .to change {display_board.board[0][0]}
            .from(" ")
            .to("X")
      end
    end
  end

end

describe TicTacToe do

  describe '#swap_player' do

    context 'when the player swap is called on X' do
      subject(:player_game) {described_class.new}


      it 'players are swapped correctly' do
        player_game.instance_variable_set(:@player_turn,'X')
        expect {player_game.swap_player}
          .to change {player_game.instance_variable_get(:@player_turn)}
            .from("X")
            .to("O")
      end
    end

    context 'when the player swap is called on O' do
      subject(:player_game) {described_class.new}


      it 'players are swapped correctly' do
        player_game.instance_variable_set(:@player_turn,'O')
        expect {player_game.swap_player}
          .to change {player_game.instance_variable_get(:@player_turn)}
            .from("O")
            .to("X")
      end
    end
  end

  describe '#play_game' do
  subject(:tic_tac_toe) { TicTacToe.new }
  let(:board_double) { instance_double(Board) }

  before do
    allow(Board).to receive(:new).and_return(board_double)
    allow(board_double).to receive(:show_board)
    allow(board_double).to receive(:get_move)
    allow(board_double).to receive(:check_win).and_return(false)
    allow(board_double).to receive(:check_draw).and_return(false)
  end

  context 'when a game is played without a win or a draw' do
    it 'continues to swap players and get moves' do
      allow(board_double).to receive(:check_win).and_return(false,false,false,true)
      expect(board_double).to receive(:get_move).at_least(:twice)
      expect(tic_tac_toe).to receive(:swap_player).at_least(:once)
      tic_tac_toe.play_game
    end
  end

  context 'when a player wins' do
    it 'ends the game with a win message' do
      allow(board_double).to receive(:check_win).and_return(true)
      expect(tic_tac_toe).to receive(:puts).with(/wins/)
      tic_tac_toe.play_game
    end
  end

  context 'when the game is a draw' do
    it 'ends the game with a draw message' do
      allow(board_double).to receive(:check_win).and_return(false)
      allow(board_double).to receive(:check_draw).and_return(true)
      expect(tic_tac_toe).to receive(:puts).with("Oh No! It's a draw!")
      tic_tac_toe.play_game
    end
  end
end
end
