require_relative 'spec_helper'

describe Maze do
  describe 'input file validation' do
    it 'should validate point type' do
      expect { Point.new(1,0,'k', 6) }.to raise_error(PointTypeArgumentError)
      expect { Point.new(1,0,'l', 6) }.to raise_error(PointTypeArgumentError)
    end
  end
end