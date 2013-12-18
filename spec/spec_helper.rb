require 'rubygems'
require 'awesome_print'
require 'terminal-table'
require 'term/ansicolor'

require_relative '../models/maze'
require_relative '../models/robot'
require_relative '../models/algorithms'

class String
  include Term::ANSIColor
end
