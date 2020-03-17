require 'spec_helper.rb'
require_relative '../lib/player'

RSpec.describe Player do
  subject { Player.new }
  describe '#move' do
    it 'checks if cells is appended with player\'s move' do
      subject.move(1)
      expect(subject.cells).to eql([1])
    end

    it 'checks if cells is appended with player\'s move' do
      subject.move(1)
      subject.move(5)
      expect(subject.cells).to eql([1, 5])
    end
  end
end
