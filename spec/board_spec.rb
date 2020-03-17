require 'spec_helper.rb'
require_relative '../lib/board'

RSpec.describe Board do
  describe 'Functionality of #board_config' do
    subject { Board.new }

    it 'check if the board position is replaced with symbol X' do
      subject.board_config('X', 1)
      expect(subject.board).to eql(['X', 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'check if the board position is replaced with symbol O' do
      subject.board_config('O', 5)
      expect(subject.board).to eql([1, 2, 3, 4, 'O', 6, 7, 8, 9])
    end
  end
end
