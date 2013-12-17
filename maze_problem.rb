require 'rubygems'
require 'awesome_print'
require 'terminal-table'
require 'term/ansicolor'

require_relative 'models/maze'
require_relative 'models/robot'
require_relative 'models/algorithms'

class String
  include Term::ANSIColor
end

maze = Maze.new('mazes/maze_1.txt')
table = Terminal::Table.new :rows => maze.grid

puts table
robot = Robot.new(maze)
robot.move_dfs Algorithms.new.dfs
puts table
