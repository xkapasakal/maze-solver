#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'
require 'awesome_print'
require 'terminal-table'
require 'term/ansicolor'

require_relative 'models/maze'
require_relative 'models/robot'
require_relative 'models/algorithms'

class String
  include Term::ANSIColor
end

program :version, '0.0.1'
program :description, 'Solving Mazes'
 
command :solve do |c|
  c.syntax = 'maze_solver solve [file]'
  c.summary = 'solve maze'
  c.description = 'solve maze given in input file with dfs algorithm'
  c.example '', 'maze_solver solve maze.txt'
  #c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    maze_file = File.new(args.first)
    maze = Maze.new(maze_file)
    table = Terminal::Table.new :rows => maze.grid

    puts table
    robot = Robot.new(maze)
    robot.move_dfs Algorithms.new.dfs
    puts table
  end
end

command :show do |c|
  c.syntax = 'maze_solver show [file]'
  c.summary = 'show maze in table'
  c.description = 'solve maze given in input file as table'
  c.example '', 'maze_solver show maze.txt'
  #c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    maze_file = File.new(args.first)
    maze = Maze.new(maze_file)
    table = Terminal::Table.new :rows => maze.grid
    puts table
  end
end


