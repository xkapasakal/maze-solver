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

    it 'should find goal at position (5, 0)' do
      maze_file = File.new('mazes/maze.txt')
      maze = Maze.new(maze_file)
      robot = Robot.new(maze)
      robot.move_dfs Algorithms.new.dfs
      robot.position.x.should eq 5
      robot.position.y.should eq 0
    end
  end
end