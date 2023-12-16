# frozen_string_literal: true
require 'rspec'
require_relative '../lib/tic_tac_toe.rb'


describe Board do



  describe '#initialize' do
    context 'When a board is created' do
      subject(:test_board) { Board.new }
      it 'there are 9 empty square' do
        expect(test_board.board).to eq([[" "," "," "],[" "," "," "],[" "," "," "]])
      end
    end
  end


  context 'check win conditions' do

    describe '#check_horizontal_win' do
      subject(:horizontal_win) { Board.new }
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
      subject(:vertical_win) { Board.new }
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
      subject(:diagonal_win) {Board.new}

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
    subject(:antidiagonal_win) {Board.new}

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
    subject(:draw_board) {Board.new}

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


end



  #Board
  # Valid Move
  # check_win
  # show_board
  # get_move --> Break out to "place move" and "get move"
