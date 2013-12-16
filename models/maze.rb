require_relative 'point'

class Maze
  attr_reader :grid, :start, :end
  def initialize(maze_file)
    @grid = []
    File.open(maze_file, 'r').each_line.with_index do |line, line_index|
      row = []
      letters = line.split(' ')
      letters.each_with_index { |letter, index|
        point = Point.new(index, line_index, letter)
        @start = point if point.is_start?
        @end = point if point.is_end?
        row.push(point)
      }
      @grid.push(row)
    end
  end
end
