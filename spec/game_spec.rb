require 'spec_helper.rb'
require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new }

  describe '#valid_input?' do
    it 'return true if input is in @available_cells array' do
      expect(game.valid_input?(4)).to eql(true)
    end

    it 'returns false if input is not in @available_cells array' do
      expect(game.valid_input?(0)).to eql(false)
    end
  end

  describe '#delete_available_cells' do
    it 'deletes the given move from @available_cells array' do
      game.delete_available_cells(6)
      expect(game.available_cells).to eql([1, 2, 3, 4, 5, 7, 8, 9])
    end
  end

  describe 'win?' do
    it 'returns true for winning combination [9,7,8]' do
      expect(game.win?([9, 7, 8])).to eql(true)
    end

    it 'returns true for winning combination [1,2,3]' do
      expect(game.win?([1, 2, 3])).to eql(true)
    end

    it 'returns true for winning combination [3,5,7]' do
      expect(game.win?([3, 5, 7])).to eql(true)
    end

    it 'returns true for winning combination [1,5,9]' do
      expect(game.win?([1, 5, 9])).to eql(true)
    end

    it 'returns true for winning combination [2,5,8]' do
      expect(game.win?([2, 5, 8])).to eql(true)
    end

    it 'returns false for faulty combination [1,4,9]' do
      expect(game.win?([1, 4, 9])).to eql(false)
    end

    it 'returns false for faulty combination [1,2,4]' do
      expect(game.win?([1, 2, 4])).to eql(false)
    end

    it 'returns false for faulty combination [3,5,8]' do
      expect(game.win?([1, 2, 4])).to eql(false)
    end

    it 'returns false for faulty combination [3,6,8]' do
      expect(game.win?([1, 2, 4])).to eql(false)
    end

    it 'returns false for faulty combination [3,9,8]' do
      expect(game.win?([1, 2, 4])).to eql(false)
    end
  end

  describe 'draw?' do
    it 'returns true if the @available_cells array is empty' do
      game.available_cells = []
      expect(game.draw?).to eql(true)
    end

    it 'returns false if the @available_cells array is not empty' do
      expect(game.draw?).to eql(false)
    end
  end
end
