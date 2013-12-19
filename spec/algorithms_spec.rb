require_relative 'spec_helper'

describe Maze do
  describe 'check algorithms' do
    it 'should mark twice all points with dfs' do
      maze_file = File.new('mazes/maze_without_end.txt')
      maze = Maze.new(maze_file)
      robot = Robot.new(maze)
      robot.move_dfs Algorithms.new.dfs
      maze.grid.each do |row|
        row.select{|point| point.type != Point::TYPES[:wall]}.each do |point|
          (point.is_marked_twice?).should be_true
        end
      end

      maze_file = File.new('mazes/maze_without_end_4x4.txt')
      maze = Maze.new(maze_file)
      robot = Robot.new(maze)
      robot.move_dfs Algorithms.new.dfs
      maze.grid.each do |row|
        row.select{|point| point.type != Point::TYPES[:wall]}.each do |point|
          (point.is_marked_twice?).should be_true
        end
      end
    end
  end
end