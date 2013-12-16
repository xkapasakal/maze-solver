#!/usr/bin/env ruby

require 'rubygems'
require 'awesome_print'
require 'terminal-table'

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


maze = Maze.new('maze.txt')
table = Terminal::Table.new :rows => maze.grid

puts table
robot = Robot.new(maze)
robot.move
puts table
# nil is border



