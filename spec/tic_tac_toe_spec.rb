# frozen_string_literal: true
require 'rspec'
require_relative '../lib/tic_tac_toe.rb'


describe Board do
  subject(:test_board) { Board.new }


  context 'check win conditions' do

    describe '#check_horizontal_win' do
      context 'When there is a winning condition' do
        context 'when a horizontal row is filled with the same symbols' do
          xit 'is a win condition' do
          end
        end

        context 'when a horizontal row is not filled with the same symbols' do
          xit 'is a win condition' do
          end
        end
      end
    end
  end
end



  #   context 'when a vertical row is filled with Xs' do
  #     xit 'is a win condition' do
  #     end
  #   end

  #   context 'when a vertical row is filled with Xs' do
  #     xit 'is a win condition' do
  #     end
  #   end

  #   context 'when a vertical row is filled with Os' do
  #     xit 'is a win condition' do
  #     end
  #   end

  #   context 'when a diagonal is filled with Xs' do
  #     xit 'is a win condition' do
  #     end
  #   end

  #   context 'when a diagonal is filled with Os' do
  #     xit 'is a win condition' do
  #     end
  #   end

  #   context 'when an anti-diagonal is filled with Xs' do
  #     xit 'is a win condition' do
  #     end
  #   end

  #   context 'when an anti-diagonal is filled with Os' do
  #     xit 'is a win condition' do
  #     end
  #   end
  # end


  # context "When there is not a winning condition"
  #   context 'when a horizontal row is filled but not with the same symbol' do
  #     xit 'is not a win condition' do
  #     end
  #   end

  #   context 'when a horizontal row is not filled, regardless of symbol' do
  #     xit 'is not a win condition' do
  #     end
  #   end

  #   context 'when a vertical column is filled but not with the same symbol' do
  #     xit 'is not a win condition' do
  #     end
  #   end

  #   context 'when a vertical column is not filled, regardless of symbol' do
  #     xit 'is not a win condition' do
  #     end
  #   end

  #   context 'when a diagonal is filled but not with the same symbol' do
  #     xit 'is not a win condition' do
  #     end
  #   end

  #   context 'when a diagonal is not filled, regardless of symbol' do
  #     xit 'is not a win condition' do
  #     end
  #   end

  #   context 'when an anti-diagonal is filled but not with the same symbol' do
  #     xit 'is not a win condition' do
  #     end
  #   end

  #   context 'when an anti-diagonal is not filled, regardless of symbol' do
  #     xit 'is not a win condition' do
  #     end
  #   end

  # context ""
