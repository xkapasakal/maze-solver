require_relative 'spec_helper'

describe Maze do
  describe 'input file validation' do
    it 'should validate line format' do
      maze_file = File.new('mazes/erroneous/maze_error_line.txt')
      expect { Maze.new(maze_file) }.to raise_error(LineFormatArgumentError)
    end

    it 'should validate empty line' do
      maze_file = File.new('mazes/erroneous/maze_error_empty_line.txt')
      expect { Maze.new(maze_file) }.to raise_error(LineFormatArgumentError)
    end

    it 'should validate that only one start point exist' do
      maze_file = File.new('mazes/erroneous/maze_error_zero_start.txt')
      expect { Maze.new(maze_file) }.to raise_error(StartPointsArgumentError)

      maze_file = File.new('mazes/erroneous/maze_error_two_starts.txt')
      expect { Maze.new(maze_file) }.to raise_error(StartPointsArgumentError)
    end
  end
end