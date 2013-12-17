#!/usr/bin/env ruby

require 'rubygems'
require 'awesome_print'
require 'terminal-table'
require 'term/ansicolor'

#require 'commander/import'
require_relative 'models/maze'
require_relative 'models/robot'

#program :version, '0.0.1'
#program :description, 'Maze Solving program'
#
#command :solve do |c|
#  c.syntax = 'maze_problem solve [options]'
#  c.summary = ''
#  c.description = ''
#  c.example 'description', 'command example'
#  c.option '--some-switch', 'Some switch that does something'
#  c.action do |args, options|
#    # Do something or c.when_called Maze_problem::Commands::Solve
#
#  end
#end


maze = Maze.new('mazes/maze_4x4.txt')
table = Terminal::Table.new :rows => maze.grid

puts table
robot = Robot.new(maze)
robot.move_dfs
puts table

class Color
  extend Term::ANSIColor
end

print Color.green, Color.bold, 'No Namespace cluttering:', Color.clear, "\n"
# nil is border



